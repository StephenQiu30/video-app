import type { HTMLAttributes } from 'react'

export function Alert({ className = '', children, ...props }: HTMLAttributes<HTMLDivElement>) {
  return (
    <div className={`alert ${className}`} role="status" {...props}>
      {children}
    </div>
  )
}

export function AlertTitle({ className = '', children, ...props }: HTMLAttributes<HTMLDivElement>) {
  return (
    <div className={`alert-title ${className}`} {...props}>
      {children}
    </div>
  )
}

export function AlertDescription({
  className = '',
  children,
  ...props
}: HTMLAttributes<HTMLDivElement>) {
  return (
    <div className={`alert-description ${className}`} {...props}>
      {children}
    </div>
  )
}
