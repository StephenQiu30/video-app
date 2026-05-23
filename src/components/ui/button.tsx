import * as React from 'react'
import { Slot } from '@radix-ui/react-slot'

type ButtonSize = 'sm' | 'md' | 'lg'
type ButtonVariant = 'default' | 'outline'

type ButtonBaseProps = {
  size?: ButtonSize
  variant?: ButtonVariant
  className?: string
}

type ButtonAsButtonProps = ButtonBaseProps &
  React.ButtonHTMLAttributes<HTMLButtonElement> & {
    asChild?: false
  }

type ButtonAsChildProps = ButtonBaseProps &
  React.AnchorHTMLAttributes<HTMLAnchorElement> & {
    asChild: true
  }

type ButtonProps = ButtonAsButtonProps | ButtonAsChildProps

export function Button({
  className = '',
  size = 'md',
  variant = 'default',
  asChild = false,
  children,
  ...props
}: ButtonProps) {
  const isAnchor = asChild
  const sizeClass = {
    sm: 'btn-sm',
    md: 'btn-md',
    lg: 'btn-lg',
  }[size]

  const variantClass = variant === 'outline' ? 'btn-outline' : 'btn-primary'
  const classes = `btn ${sizeClass} ${variantClass} ${className}`
  const classed = Object.assign({}, props as React.HTMLAttributes<HTMLElement>, { className: classes })

  if (isAnchor) {
    return (
      <Slot {...classed}>
        {children}
      </Slot>
    )
  }

  return (
    <button className={`btn ${sizeClass} ${variantClass} ${className}`} {...(props as React.ButtonHTMLAttributes<HTMLButtonElement>)}>
      {children}
    </button>
  )
}
