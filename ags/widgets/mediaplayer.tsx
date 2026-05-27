import Gtk from "gi://Gtk?version=4.0"
import GLib from "gi://GLib"
import { execAsync } from "ags/process"
import { createPoll } from "ags/time"
import { colors, cssFrom } from "./theme"

interface PlayerInfo {
  artist: string
  title: string
  status: string
  pos: number
  len: number
}

function parsePlayer(): PlayerInfo {
  try {
    const raw = String(execAsync("playerctl metadata --format '{{artist}}\n{{title}}\n{{status}}\n{{position}}\n{{mpris:length}}' 2>/dev/null || true"))
    const lines = raw.trim().split("\n")
    return {
      artist: lines[0] || "No Artist",
      title: lines[1] || "No Track",
      status: lines[2] || "Stopped",
      pos: parseInt(lines[3]) || 0,
      len: parseInt(lines[4]) || 1,
    }
  } catch { return { artist: "—", title: "Nothing Playing", status: "Stopped", pos: 0, len: 1 } }
}

function formatTime(us: number): string {
  const s = Math.floor(us / 1_000_000)
  const m = Math.floor(s / 60)
  const sec = s % 60
  return `${m}:${String(sec).padStart(2, "0")}`
}

export default function MediaPlayer(close: () => void) {
  const info = createPoll(null, 1000, parsePlayer)

  const seek = (_: unknown, val: number) => {
    execAsync(`playerctl position ${val * (info().len / 1_000_000)}`)
  }
  const prev = () => execAsync("playerctl previous")
  const next = () => execAsync("playerctl next")
  const playPause = () => execAsync("playerctl play-pause")
  const progress = () => info().len > 0 ? info().pos / info().len : 0

  return (
    <box orientation={Gtk.Orientation.VERTICAL} cssClasses={["win"]} spacing={8}>
      <label label=" Media Player" cssClasses={["title"]} />
      <label label={info().status} cssClasses={["small"]} />
      <label label={info().title} cssClasses={["label"]} wrap hexpand />
      <label label={info().artist} cssClasses={["small"]} />
      <box spacing={6}>
        <label label={formatTime(info().pos)} cssClasses={["small"]} />
        <Gtk.Scale
          hexpand
          drawValue={false}
          value={progress()}
          onChangeValue={seek}
          cssClasses={["slider"]}
          range={[0, 1]}
        />
        <label label={formatTime(info().len)} cssClasses={["small"]} />
      </box>
      <box homogeneous spacing={6}>
        <button onClicked={prev} cssClasses={["btn"]}>
          <label label="" cssClasses={["icon"]} />
        </button>
        <button onClicked={playPause} cssClasses={["btn", "btn-accent"]}>
          <label label={info().status === "Playing" ? "" : ""} cssClasses={["icon"]} />
        </button>
        <button onClicked={next} cssClasses={["btn"]}>
          <label label="" cssClasses={["icon"]} />
        </button>
      </box>
      <button onClicked={close} cssClasses={["btn", "btn-red"]}>
        <label label=" Close" />
      </button>
    </box>
  )
}
