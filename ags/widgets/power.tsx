import Gtk from "gi://Gtk?version=4.0"
import GLib from "gi://GLib"
import { execAsync } from "ags/process"
import { createPoll } from "ags/time"
import { colors, cssFrom } from "./theme"

const profiles = [
  { id: "power-saver", icon: "", label: "Power Saver" },
  { id: "balanced", icon: "", label: "Balanced" },
  { id: "performance", icon: "", label: "Performance" },
]

export default function PowerProfiles(close: () => void) {
  const current = createPoll(null, 5000, () => {
    try {
      const raw = String(execAsync("powerprofilesctl get 2>/dev/null || echo balanced"))
      return raw.trim()
    } catch { return "balanced" }
  })

  const set = (id: string) => {
    execAsync(`powerprofilesctl set ${id}`).catch(() => {})
  }

  return (
    <box orientation={Gtk.Orientation.VERTICAL} cssClasses={["win"]} spacing={8}>
      <label label=" Power Profiles" cssClasses={["title"]} />
      {profiles.map((p) => {
        const active = current() === p.id
        return (
          <button
            onClicked={() => set(p.id)}
            cssClasses={["btn", ...(active ? ["btn-accent"] : [])]}
          >
            <box spacing={8}>
              <label label={p.icon} cssClasses={["icon"]} />
              <label label={p.label} hexpand cssClasses={["label"]} />
              {active && <label label="" cssClasses={["small"]} />}
            </box>
          </button>
        )
      })}
      <button onClicked={close} cssClasses={["btn", "btn-red"]}>
        <label label=" Close" />
      </button>
    </box>
  )
}
