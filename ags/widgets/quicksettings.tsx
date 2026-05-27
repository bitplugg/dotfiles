import Gtk from "gi://Gtk?version=4.0"
import GLib from "gi://GLib"
import { execAsync } from "ags/process"
import { createPoll } from "ags/time"
import { colors, cssFrom } from "./theme"

function VolumeSlider() {
  const VOL_CMD = "wpctl get-volume @DEFAULT_AUDIO_SINK@"
  const vol = createPoll(null, 500, () => {
    try {
      const out = String(execAsync(VOL_CMD))
      const m = out.match(/(\d+\.\d+)/)
      const muted = out.includes("MUTED")
      return { val: m ? parseFloat(m[1]) : 0, muted }
    } catch { return { val: 0, muted: false } }
  })

  const icon = createPoll(null, 500, () => {
    const v = vol()?.val ?? 0
    if (vol()?.muted) return ""
    if (v < 0.3) return ""
    if (v < 0.7) return ""
    return ""
  })

  const setVol = (_: unknown, val: number) => {
    execAsync(`wpctl set-volume @DEFAULT_AUDIO_SINK@ ${Math.round(val * 100)}%`)
  }
  const toggleMute = () => execAsync("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")

  return (
    <box spacing={8} cssClasses={["row"]}>
      <button onClicked={toggleMute} cssClasses={["btn"]}>
        <label label={icon} cssClasses={["icon"]} />
      </button>
      <Gtk.Scale
        hexpand
        drawValue={false}
        value={vol().val}
        onChangeValue={setVol}
        cssClasses={["slider"]}
        range={[0, 1]}
      />
      <label label={`${Math.round(vol().val * 100)}%`} cssClasses={["label"]} />
    </box>
  )
}

function BrightnessSlider() {
  const bri = createPoll(null, 2000, () => {
    try {
      const out = String(execAsync("brightnessctl get"))
      const max = String(execAsync("brightnessctl max"))
      return parseInt(out) / parseInt(max)
    } catch { return 0.5 }
  })

  const setBri = (_: unknown, val: number) => {
    execAsync(`brightnessctl set ${Math.round(val * 100)}%`)
  }

  return (
    <box spacing={8} cssClasses={["row"]}>
      <label label="󰃟" cssClasses={["icon"]} />
      <Gtk.Scale
        hexpand
        drawValue={false}
        value={bri()}
        onChangeValue={setBri}
        cssClasses={["slider"]}
        range={[0, 1]}
      />
      <label label={`${Math.round(bri() * 100)}%`} cssClasses={["label"]} />
    </box>
  )
}

function NetworkToggle() {
  const net = createPoll(null, 5000, () => {
    try {
      const out = String(execAsync("nmcli -t -f TYPE,STATE device"))
      return out.includes("wifi:connected") ? "connected" : "disconnected"
    } catch { return "unknown" }
  })

  const toggle = () => {
    if (net() === "connected") execAsync("nmcli radio wifi off")
    else execAsync("nmcli radio wifi on")
  }

  const icon = createPoll(null, 5000, () => net() === "connected" ? "" : "睊")

  return (
    <button onClicked={toggle} cssClasses={["btn", "btn-accent"]}>
      <box spacing={6}>
        <label label={icon} cssClasses={["icon"]} />
        <label label={net() === "connected" ? "WiFi On" : "WiFi Off"} cssClasses={["label"]} />
      </box>
    </button>
  )
}

function BluetoothToggle() {
  const bt = createPoll(null, 5000, () => {
    try { return String(execAsync("bluetoothctl show")).includes("Powered: yes") ? "on" : "off" }
    catch { return "unknown" }
  })

  const toggle = () => {
    if (bt() === "on") execAsync("bluetoothctl power off")
    else execAsync("bluetoothctl power on")
  }

  return (
    <button onClicked={toggle} cssClasses={["btn", "btn-accent"]}>
      <box spacing={6}>
        <label label="" cssClasses={["icon"]} />
        <label label={bt() === "on" ? "Bluetooth On" : "Bluetooth Off"} cssClasses={["label"]} />
      </box>
    </button>
  )
}

function NightModeToggle() {
  const nm = createPoll(null, 5000, () => {
    try {
      const out = String(execAsync("pgrep -x wlsunset"))
      return out ? "on" : "off"
    } catch { return "off" }
  })

  const toggle = () => execAsync("~/.local/bin/night-mode")

  return (
    <button onClicked={toggle} cssClasses={["btn", "btn-accent"]}>
      <box spacing={6}>
        <label label="" cssClasses={["icon"]} />
        <label label={nm() === "on" ? "Night On" : "Night Off"} cssClasses={["label"]} />
      </box>
    </button>
  )
}

function MicToggle() {
  const mic = createPoll(null, 2000, () => {
    try {
      const out = String(execAsync("wpctl get-volume @DEFAULT_AUDIO_SOURCE@"))
      return out.includes("MUTED") ? "muted" : "unmuted"
    } catch { return "unknown" }
  })

  const toggle = () => execAsync("~/.local/bin/mic-toggle")

  return (
    <button onClicked={toggle} cssClasses={["btn", mic() === "muted" ? "btn-red" : "btn-accent"]}>
      <box spacing={6}>
        <label label={mic() === "muted" ? "" : ""} cssClasses={["icon"]} />
        <label label={mic() === "muted" ? "Mic Muted" : "Mic On"} cssClasses={["label"]} />
      </box>
    </button>
  )
}

function IdleToggle() {
  const idle = createPoll(null, 5000, () => {
    try {
      const out = String(execAsync("~/.local/bin/idle-inhibit status"))
      return out.includes("active") ? "inhibited" : "normal"
    } catch { return "normal" }
  })

  const toggle = () => execAsync("~/.local/bin/idle-inhibit")

  return (
    <button onClicked={toggle} cssClasses={["btn", "btn-accent"]}>
      <box spacing={6}>
        <label label="" cssClasses={["icon"]} />
        <label label={idle() === "inhibited" ? "Idle Off" : "Idle On"} cssClasses={["label"]} />
      </box>
    </button>
  )
}

function LayoutToggle() {
  const layout = createPoll(null, 1000, () => {
    try {
      const out = String(execAsync("hyprctl devices -j"))
      const m = JSON.parse(out)
      const kb = m.keyboards?.[0]?.active_keymap || "us"
      return kb.includes("Russian") ? "RU" : "EN"
    } catch { return "EN" }
  })

  const toggle = () => {
    try {
      const cur = String(execAsync("hyprctl devices -j"))
      const m = JSON.parse(cur)
      const name = m.keyboards?.[0]?.name || "keyboard"
      execAsync(`hyprctl switchxkblayout "${name}" next`)
    } catch { }
  }

  return (
    <button onClicked={toggle} cssClasses={["btn", "btn-accent"]}>
      <box spacing={6}>
        <label label="" cssClasses={["icon"]} />
        <label label={layout()} cssClasses={["label"]} />
      </box>
    </button>
  )
}

export default function QuickSettings(close: () => void) {
  return (
    <box orientation={Gtk.Orientation.VERTICAL} cssClasses={["win"]} spacing={8}>
      <label label=" Quick Settings" cssClasses={["title"]} />
      <VolumeSlider />
      <BrightnessSlider />
      <box homogeneous spacing={6}>
        <NetworkToggle />
        <BluetoothToggle />
      </box>
      <box homogeneous spacing={6}>
        <NightModeToggle />
        <MicToggle />
      </box>
      <box homogeneous spacing={6}>
        <IdleToggle />
        <LayoutToggle />
      </box>
      <box homogeneous spacing={6}>
        <button onClicked={close} cssClasses={["btn", "btn-red"]} hexpand>
          <label label=" Close" />
        </button>
      </box>
    </box>
  )
}
