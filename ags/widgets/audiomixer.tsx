import Gtk from "gi://Gtk?version=4.0"
import GLib from "gi://GLib"
import { execAsync } from "ags/process"
import { createPoll } from "ags/time"
import { colors, cssFrom } from "./theme"

interface AppVol { name: string; index: number; vol: number; muted: boolean }

function getSinks(): AppVol[] {
  try {
    const raw = String(execAsync("wpctl status"))
    const lines = raw.split("\n")
    const sinks: AppVol[] = []
    let inSinks = false
    for (const line of lines) {
      if (line.includes("Sinks")) { inSinks = true; continue }
      if (inSinks && line.includes("Sources")) break
      if (!inSinks) continue
      const m = line.match(/\.(\d+)\.\s+(.+)/)
      if (m) {
        const idx = parseInt(m[1])
        const name = m[2].trim().replace(/\[.*\]/, "").trim()
        const volRaw = String(execAsync(`wpctl get-volume ${idx}`))
        const vm = volRaw.match(/(\d+\.\d+)/)
        sinks.push({ name: name.slice(0, 30), index: idx, vol: vm ? parseFloat(vm[1]) : 0, muted: volRaw.includes("MUTED") })
      }
    }
    return sinks.length ? sinks : [{ name: "Default", index: 0, vol: 0.5, muted: false }]
  } catch { return [{ name: "Default", index: 0, vol: 0.5, muted: false }] }
}

export default function AudioMixer(close: () => void) {
  const sinks = createPoll(null, 2000, getSinks)

  const setVol = (idx: number, _: unknown, val: number) => {
    execAsync(`wpctl set-volume ${idx} ${Math.round(val * 100)}%`)
  }
  const toggleMute = (idx: number) => {
    execAsync(`wpctl set-mute ${idx} toggle`)
  }

  return (
    <box orientation={Gtk.Orientation.VERTICAL} cssClasses={["win"]} spacing={8}>
      <label label=" Audio Mixer" cssClasses={["title"]} />
      {sinks().map((s) => (
        <box orientation={Gtk.Orientation.VERTICAL} spacing={4}>
          <box spacing={6}>
            <button onClicked={() => toggleMute(s.index)} cssClasses={["btn"]}>
              <label label={s.muted ? "" : ""} cssClasses={["icon"]} />
            </button>
            <label label={s.name} hexpand cssClasses={["label"]} />
            <label label={`${Math.round(s.vol * 100)}%`} cssClasses={["small"]} />
          </box>
          <Gtk.Scale
            hexpand
            drawValue={false}
            value={s.vol}
            onChangeValue={(_, v) => setVol(s.index, _, v)}
            cssClasses={["slider"]}
            range={[0, 1]}
          />
        </box>
      ))}
      <button onClicked={close} cssClasses={["btn", "btn-red"]}>
        <label label=" Close" />
      </button>
    </box>
  )
}
