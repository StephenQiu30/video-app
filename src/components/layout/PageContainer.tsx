import { PageHeader } from './PageHeader'

type PageContainerProps = {
  children: React.ReactNode
  title?: string
  description?: string
  actions?: React.ReactNode
  className?: string
}

export function PageContainer({ children, title, description, actions, className = '' }: PageContainerProps) {
  return (
    <section className={`page-container ${className}`}>
      {title && <PageHeader title={title} description={description} actions={actions} />}
      {children}
    </section>
  )
}
