import app from "ags/gtk4/app"
import GLib from "gi://GLib"
import Astal from "gi://Astal?version=4.0"
import { createBinding, For, onCleanup } from "ags"
import { createPoll } from "ags/time"
import Gdk from "gi://Gdk?version=4.0"

function Clock() {
  const time = createPoll("", 1000, () => {
    return GLib.DateTime.new_now_local().format("%H:%M:%S")!
  })

  return <label label={time} cssClasses={["clock"]} />
}

function DateWidget() {
  const date = createPoll("", 60000, () => {
    return GLib.DateTime.new_now_local().format("%a %b %d")!
  })

  return <label label={date} cssClasses={["date"]} />
}

function Bar({ gdkmonitor }: { gdkmonitor: Gdk.Monitor }) {
  let win: Astal.Window
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  onCleanup(() => { win.destroy() })

  return (
    <window
      $={(self) => (win = self)}
      visible
      namespace="ags-bar"
      name={`bar-${gdkmonitor.connector}`}
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={app}
    >
      <centerbox>
        <box $type="start" spacing={8}>
          <label label="   AGS  " cssClasses={["logo"]} />
        </box>
        <box $type="center">
          <Clock />
        </box>
        <box $type="end" spacing={8}>
          <DateWidget />
        </box>
      </centerbox>
    </window>
  )
}

const css = `
window { background: rgba(30, 30, 46, 0.85); color: #cdd6f4; font-family: JetBrainsMono Nerd Font; font-size: 13px; border-bottom: 1px solid rgba(137, 180, 250, 0.3); }
label { padding: 0 6px; }
.clock { font-size: 14px; color: #a6e3a1; font-weight: bold; }
.date { color: #f5c2e7; }
.logo { color: #89b4fa; font-weight: bold; }
`

app.start({
  css,
  gtkTheme: "Adwaita",
  main() {
    return (
      <For each={createBinding(app, "monitors")}>
        {(monitor) => <Bar gdkmonitor={monitor} />}
      </For>
    )
  },
})
