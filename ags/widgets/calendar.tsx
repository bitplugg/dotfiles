import Gtk from "gi://Gtk?version=4.0"
import GLib from "gi://GLib"
import { colors, cssFrom } from "./theme"

const MONTHS = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь",
  "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]
const DAYS = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"]

function getDays(year: number, month: number): (number | null)[][] {
  const first = new Date(year, month, 1).getDay()
  const monStart = first === 0 ? 6 : first - 1
  const daysInMonth = new Date(year, month + 1, 0).getDate()
  const weeks: (number | null)[][] = []
  let week: (number | null)[] = []
  for (let i = 0; i < monStart; i++) week.push(null)
  for (let d = 1; d <= daysInMonth; d++) {
    week.push(d)
    if (week.length === 7) { weeks.push(week); week = [] }
  }
  if (week.length) { while (week.length < 7) week.push(null); weeks.push(week) }
  return weeks
}

export default function CalendarWidget(close: () => void) {
  const now = GLib.DateTime.new_now_local()
  const year = now.getYear()
  const month = now.getMonth()
  const today = now.getDayOfMonth()
  const weeks = getDays(year, month)

  const isToday = (d: number | null) => d === today

  return (
    <box orientation={Gtk.Orientation.VERTICAL} cssClasses={["win"]} spacing={8}>
      <label label=" Calendar" cssClasses={["title"]} />
      <label label={`${MONTHS[month]} ${year}`} cssClasses={["label"]} />
      {/* Day headers */}
      <box spacing={4} homogeneous>
        {DAYS.map((d) => <label label={d} cssClasses={["small"]} />)}
      </box>
      {/* Day grid */}
      {weeks.map((week) => (
        <box spacing={4} homogeneous>
          {week.map((d) => {
            if (d === null) return <label label="" cssClasses={["label"]} />
            const cls = isToday(d) ? "btn btn-accent" : "btn"
            return (
              <button cssClasses={[cls]}>
                <label label={`${d}`} cssClasses={["label"]} />
              </button>
            )
          })}
        </box>
      ))}
      <box cssClasses={["sep"]} />
      <label label={`${now.format("%A")}`} cssClasses={["label"]} />
      <label label={`${now.format("%H:%M")}`} cssClasses={["title"]} />
      <button onClicked={close} cssClasses={["btn", "btn-red"]}>
        <label label=" Close" />
      </button>
    </box>
  )
}
