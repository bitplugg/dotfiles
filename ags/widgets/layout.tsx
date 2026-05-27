import Gtk from "gi://Gtk?version=4.0"
import GLib from "gi://GLib"
import { execAsync } from "ags/process"
import { createPoll } from "ags/time"
import { colors, cssFrom } from "./theme"

export default function LayoutSwitcher(close: () => void) {
  const current = createPoll(null, 500, () => {
    try {
      const out = String(execAsync("hyprctl devices -j"))
      const m = JSON.parse(out)
      const kb = m.keyboards?.[0]
      return {
        name: kb?.name || "keyboard",
        layout: kb?.active_keymap || "English (US)",
        caps: kb?.caps_state === true,
      }
    } catch { return { name: "keyboard", layout: "English (US)", caps: false } }
  })

  const switchTo = (lang: string) => {
    execAsync(`hyprctl switchxkblayout "${current().name}" ${lang}`).catch(() => {})
  }

  const layouts = [
    { id: "0", label: "English (US)", icon: "US" },
    { id: "1", label: "Русский", icon: "RU" },
  ]

  return (
    <box orientation={Gtk.Orientation.VERTICAL} cssClasses={["win"]} spacing={8}>
      <label label=" Keyboard Layout" cssClasses={["title"]} />
      {current().caps && (
        <label label="󰘲 CAPS LOCK ON" cssClasses={["label"]} />
      )}
      <box cssClasses={["sep"]} />
      {layouts.map((l) => {
        const active = current().layout.toLowerCase().includes(l.label.toLowerCase())
        return (
          <button onClicked={() => switchTo(l.id)} cssClasses={["btn", ...(active ? ["btn-accent"] : [])]}>
            <box spacing={8}>
              <label label={l.icon} cssClasses={["icon"]} />
              <label label={l.label} hexpand cssClasses={["label"]} />
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
