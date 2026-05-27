import Astal from "gi://Astal?version=4.0"

const colors = {
  bg: "rgba(30, 30, 46, 0.95)",
  fg: "#cdd6f4",
  accent: "#89b4fa",
  red: "#f38ba8",
  green: "#a6e3a1",
  yellow: "#f9e2af",
  surface: "rgba(69, 71, 90, 0.5)",
  surface2: "rgba(69, 71, 90, 0.8)",
  muted: "#585b70",
}

const base = `
* { all: unset; font-family: JetBrainsMono Nerd Font; }
window { background: ${colors.bg}; border: 1px solid ${colors.accent}33; border-radius: 12px; }
.win { padding: 16px; }
.title { font-size: 16px; font-weight: bold; color: ${colors.accent}; margin-bottom: 12px; }
.row { margin: 4px 0; }
.btn { background: ${colors.surface}; border-radius: 8px; padding: 8px 12px; }
.btn:hover { background: ${colors.surface2}; }
.btn label { color: ${colors.fg}; font-size: 13px; }
.btn-accent { background: ${colors.accent}33; }
.btn-accent:hover { background: ${colors.accent}44; }
.btn-red { background: ${colors.red}33; }
.btn-red:hover { background: ${colors.red}44; }
.slider { min-height: 6px; border-radius: 3px; }
.slider trough { background: ${colors.muted}; border-radius: 3px; min-height: 6px; }
.slider highlight { background: ${colors.accent}; border-radius: 3px; }
.slider slider { background: ${colors.accent}; border-radius: 50%; min-width: 14px; min-height: 14px; }
.icon { font-size: 18px; min-width: 24px; }
.label { color: ${colors.fg}; font-size: 13px; }
.small { color: ${colors.muted}; font-size: 11px; }
.sep { min-height: 1px; background: ${colors.muted}44; margin: 8px 0; }
`

export { colors, base, cssFrom }
function cssFrom(extra: string) { return base + extra }
