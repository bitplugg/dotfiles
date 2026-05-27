import app from "ags/gtk4/app"
import Astal from "gi://Astal?version=4.0"
import Gtk from "gi://Gtk?version=4.0"
import { cssFrom } from "./widgets/theme"
import QuickSettings from "./widgets/quicksettings"
import MediaPlayer from "./widgets/mediaplayer"
import Monitor from "./widgets/monitor"
import AudioMixer from "./widgets/audiomixer"
import CalendarWidget from "./widgets/calendar"
import ScreenshotCapture from "./widgets/screenshot"
import PowerProfiles from "./widgets/power"
import LayoutSwitcher from "./widgets/layout"

function makeWindow(ns: string, title: string, widget: (close: () => void) => Gtk.Widget) {
  let win: Astal.Window

  const close = () => { if (win) win.visible = false }

  return (
    <window
      $={(self) => (win = self)}
      visible={false}
      namespace={ns}
      name={ns}
      application={app}
      exclusivity={Astal.Exclusivity.NORMAL}
      keymode={Astal.Keymode.ON_DEMAND}
      defaultWidth={380}
    >
      <box>
        {widget(close)}
      </box>
    </window>
  )
}

const WIDGETS: Record<string, ReturnType<typeof makeWindow>> = {
  quicksettings: makeWindow("ags-quicksettings", "Quick Settings", QuickSettings),
  mediaplayer:   makeWindow("ags-mediaplayer",   "Media Player",   MediaPlayer),
  monitor:       makeWindow("ags-monitor",       "System Monitor",  Monitor),
  audiomixer:    makeWindow("ags-audiomixer",    "Audio Mixer",    AudioMixer),
  calendar:      makeWindow("ags-calendar",      "Calendar",        CalendarWidget),
  screenshot:    makeWindow("ags-screenshot",    "Screenshot",      ScreenshotCapture),
  power:         makeWindow("ags-power",         "Power Profiles", PowerProfiles),
  layout:        makeWindow("ags-layout",        "Keyboard Layout", LayoutSwitcher),
}

app.start({
  css: cssFrom(""),
  gtkTheme: "Adwaita",
  instanceName: "ags-widgets",
  main() {
    return <box>{Object.values(WIDGETS)}</box>
  },
})
