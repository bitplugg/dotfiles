import Gtk from "gi://Gtk?version=4.0"
import GLib from "gi://GLib"
import { execAsync } from "ags/process"
import { createPoll } from "ags/time"
import { colors, cssFrom } from "./theme"

interface SysInfo { cpu: number; memPct: number; memUsed: string; memTotal: string; temp: string }

function readSys(): SysInfo {
  const def = { cpu: 0, memPct: 0, memUsed: "0", memTotal: "0", temp: "0°C" }
  try {
    const cpuRaw = String(execAsync("top -bn1 | grep 'Cpu(s)' | awk '{print $2}'")).trim()
    const cpu = parseFloat(cpuRaw) || 0
    const memRaw = String(execAsync("free -h | grep Mem"))
    const m = memRaw.match(/Mem:\s+(\S+)\s+(\S+)\s+(\S+)/)
    const memUsed = m?.[2] || "0"
    const memTotal = m?.[1] || "0"
    const memPct = m ? parseFloat(m[2]) / parseFloat(m[1]) * 100 : 0
    const temp = String(execAsync("cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null || echo 0")).trim()
    const tempC = Math.round(parseInt(temp) / 1000)
    return { cpu, memPct, memUsed, memTotal, temp: `${tempC}°C` }
  } catch { return def }
}

interface DiskInfo { name: string; used: string; total: string; pct: number }

function readDisk(): DiskInfo {
  try {
    const raw = String(execAsync("df -h / | tail -1"))
    const parts = raw.split(/\s+/)
    return { name: "/", used: parts[2] || "0", total: parts[1] || "0", pct: parseInt(parts[4]) || 0 }
  } catch { return { name: "/", used: "0", total: "0", pct: 0 } }
}

function Uptime() {
  const up = createPoll(null, 60000, () => {
    try {
      const raw = String(execAsync("uptime -p")).trim().replace("up ", "")
      return raw
    } catch { return "?" }
  })
  return <label label={` ${up()}`} cssClasses={["label"]} />
}

export default function Monitor(close: () => void) {
  const info = createPoll(null, 2000, readSys)
  const disk = createPoll(null, 60000, readDisk)

  return (
    <box orientation={Gtk.Orientation.VERTICAL} cssClasses={["win"]} spacing={8}>
      <label label=" System Monitor" cssClasses={["title"]} />
      <Uptime />
      <box cssClasses={["sep"]} />
      <box spacing={8}>
        <label label="CPU" cssClasses={["small"]} />
        <Gtk.LevelBar value={info().cpu / 100} maxValue={1} />
        <label label={`${info().cpu.toFixed(1)}%`} cssClasses={["label"]} />
      </box>
      <box spacing={8}>
        <label label="RAM" cssClasses={["small"]} />
        <Gtk.LevelBar value={info().memPct / 100} maxValue={1} />
        <label label={`${info().memUsed}/${info().memTotal}`} cssClasses={["label"]} />
      </box>
      <box spacing={8}>
        <label label="Disk" cssClasses={["small"]} />
        <Gtk.LevelBar value={disk().pct / 100} maxValue={1} />
        <label label={`${disk().used}/${disk().total}`} cssClasses={["label"]} />
      </box>
      <box spacing={8}>
        <label label="Temp" cssClasses={["small"]} />
        <Gtk.LevelBar value={parseInt(info().temp) / 100} maxValue={1} />
        <label label={info().temp} cssClasses={["label"]} />
      </box>
      <button onClicked={close} cssClasses={["btn", "btn-red"]}>
        <label label=" Close" />
      </button>
    </box>
  )
}
