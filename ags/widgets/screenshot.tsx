import Gtk from "gi://Gtk?version=4.0"
import { execAsync } from "ags/process"
import { colors, cssFrom } from "./theme"

const screenshots = [
  { label: " Monitor", cmd: "hyprshot -m output" },
  { label: " Region", cmd: "hyprshot -m region" },
  { label: " Window", cmd: "hyprshot -m window" },
  { label: " Record", cmd: "wf-recorder -f ~/Videos/recording_$(date +%Y%m%d_%H%M%S).mp4 -g $(slurp)" },
  { label: " Record Stop", cmd: "pkill -INT wf-recorder" },
]

export default function ScreenshotCapture(close: () => void) {
  const capture = (cmd: string) => {
    execAsync(cmd).catch(() => {})
    close()
  }

  return (
    <box orientation={Gtk.Orientation.VERTICAL} cssClasses={["win"]} spacing={8}>
      <label label=" Screenshot Capture" cssClasses={["title"]} />
      {screenshots.map((s) => (
        <button onClicked={() => capture(s.cmd)} cssClasses={["btn", "btn-accent"]}>
          <label label={s.label} cssClasses={["label"]} />
        </button>
      ))}
      <button onClicked={close} cssClasses={["btn", "btn-red"]}>
        <label label=" Close" />
      </button>
    </box>
  )
}
