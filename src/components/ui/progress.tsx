type ProgressProps = {
  value: number
}

export function Progress({ value }: ProgressProps) {
  const percent = Math.max(0, Math.min(100, Math.round(value)))
  return (
    <div className="progress-track" aria-valuemin={0} aria-valuemax={100} aria-valuenow={percent} role="progressbar">
      <div className="progress-bar" style={{ width: `${percent}%` }} />
    </div>
  )
}
