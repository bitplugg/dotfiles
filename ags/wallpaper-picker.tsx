import app from "ags/gtk4/app"
import GLib from "gi://GLib"
import Gio from "gi://Gio?version=2.0"
import Gtk from "gi://Gtk?version=4.0"
import Gdk from "gi://Gdk?version=4.0"
import Astal from "gi://Astal?version=4.0"
import { onCleanup } from "ags"
import { execAsync } from "ags/process"

const HOME = GLib.get_home_dir()
const WALL_DIR = `${HOME}/Pictures/wallpapers`
const THUMB_W = 200
const THUMB_H = 125

const WALLPAPER_CMD = `${HOME}/.local/bin/wallpaper`

function findImages(dir: string): string[] {
  const results: string[] = []
  try {
    const f = Gio.File.new_for_path(dir)
    const enumerator = f.enumerateChildren("standard::name", Gio.FileQueryInfoFlags.NONE, null)
    let info: Gio.FileInfo | null
    while ((info = enumerator.next_file(null)) !== null) {
      const name = info.get_name()
      if (/\.(jpg|jpeg|png|gif|bmp|webp)$/i.test(name)) {
        results.push(`${dir}/${name}`)
      }
    }
    enumerator.close(null)
  } catch { /* dir missing */ }
  return results.sort(() => Math.random() - 0.5)
}

function genThumb(path: string, cache: string): void {
  execAsync(
    `magick "${path}" -resize ${THUMB_W}x${THUMB_H}^ -gravity center -extent ${THUMB_W}x${THUMB_H} "${cache}" 2>/dev/null || ` +
    `convert "${path}" -resize ${THUMB_W}x${THUMB_H}^ -gravity center -extent ${THUMB_W}x${THUMB_H} "${cache}" 2>/dev/null || ` +
    `true`,
  ).catch(() => {})
}

function Thumbnail({ path, onSelect }: { path: string; onSelect: (p: string) => void }) {
  const name = path.split("/").pop() ?? ""
  const displayName = name.length > 30 ? name.slice(0, 28) + "…" : name

  // Use original file - Gtk handles scaling
  return (
    <Gtk.Box orientation={Gtk.Orientation.VERTICAL} spacing={2}>
      <Gtk.Button
        onClicked={() => onSelect(path)}
        cursor={Gdk.Cursor.new_from_name("pointer")}
      >
        <Gtk.Box cssClasses={["thumb"]}>
          <Gtk.Image file={path} />
        </Gtk.Box>
      </Gtk.Button>
      <Gtk.Label label={displayName} cssClasses={["name"]} />
    </Gtk.Box>
  )
}

function chunkArray<T>(arr: T[], n: number): T[][] {
  const r: T[][] = []
  for (let i = 0; i < arr.length; i += n) r.push(arr.slice(i, i + n))
  return r
}

function WallpaperPicker() {
  const { TOP, BOTTOM, LEFT, RIGHT } = Astal.WindowAnchor
  const paths = findImages(WALL_DIR)
  const cols = 4
  const rows = chunkArray(paths, cols)
  let win: Astal.Window

  const setWallpaper = (path: string) => {
    execAsync(`'${WALLPAPER_CMD}' '${path}'`).catch(() => {})
  }

  onCleanup(() => { if (win) win.destroy() })

  const css = `
    window { background: rgba(30, 30, 46, 0.95); }
    .wrapper { padding: 16px; }
    .toolbar { margin-bottom: 8px; }
    .title { font-size: 18px; font-weight: bold; color: #89b4fa; }
    .count { color: #585b70; font-size: 12px; }
    .thumb { min-width: ${THUMB_W}px; min-height: ${THUMB_H}px; background: rgba(0,0,0,0.3); border-radius: 8px; }
    .thumb image { border-radius: 8px; }
    .fallback { font-size: 48px; color: #585b70; min-width: ${THUMB_W}px; min-height: ${THUMB_H}px; }
    .name { font-size: 11px; color: #a6adc8; }
    button { background: none; border: none; padding: 4px; border-radius: 8px; }
    button:hover { background: rgba(137, 180, 250, 0.15); }
    .btn {
      background: rgba(137, 180, 250, 0.15);
      border-radius: 6px; padding: 6px 14px; border: none;
    }
    .btn:hover { background: rgba(137, 180, 250, 0.3); }
    .btn label { color: #cdd6f4; font-size: 13px; }
    scrollbar { background: rgba(0,0,0,0.3); border-radius: 4px; min-width: 8px; }
    scrollbar slider { background: rgba(137, 180, 250, 0.5); border-radius: 4px; min-width: 6px; }
  `

  return (
    <Astal.Window
      $={(self) => (win = self)}
      visible
      namespace="ags-wallpaper-picker"
      name="wallpaper-picker"
      application={app}
      exclusivity={Astal.Exclusivity.NORMAL}
      anchor={TOP | BOTTOM | LEFT | RIGHT}
      margin={40}
      defaultWidth={960}
      defaultHeight={640}
    >
      <Gtk.Box orientation={Gtk.Orientation.VERTICAL} cssClasses={["wrapper"]}>
        <Gtk.Box spacing={8} cssClasses={["toolbar"]}>
          <Gtk.Label label=" Wallpaper Picker" cssClasses={["title"]} hexpand={true} />
          <Gtk.Label label={`${paths.length} wp`} cssClasses={["count"]} />
          <Gtk.Button
            cssClasses={["btn"]}
            onClicked={() => paths.length > 0 && setWallpaper(paths[Math.floor(Math.random() * paths.length)])}
          >
            <Gtk.Label label=" Random" />
          </Gtk.Button>
          <Gtk.Button cssClasses={["btn"]} onClicked={() => win.close()}>
            <Gtk.Label label=" Close" />
          </Gtk.Button>
        </Gtk.Box>
        <Gtk.ScrolledWindow vexpand={true}>
          <Gtk.Viewport>
            <Gtk.Box orientation={Gtk.Orientation.VERTICAL} spacing={6}>
              {rows.map((row) => (
                <Gtk.Box spacing={6} homogeneous={true}>
                  {row.map((path) => (
                    <Thumbnail path={path} onSelect={setWallpaper} />
                  ))}
                </Gtk.Box>
              ))}
            </Gtk.Box>
          </Gtk.Viewport>
        </Gtk.ScrolledWindow>
      </Gtk.Box>
    </Astal.Window>
  )
}

app.start({
  gtkTheme: "Adwaita",
  instanceName: "ags-wallpaper-picker",
  main() { return <WallpaperPicker /> },
})
