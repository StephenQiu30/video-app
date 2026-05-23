import {
  DownloadOutlined,
  FilePdfOutlined,
  ReloadOutlined,
  StopOutlined,
} from '@ant-design/icons';
import { PageContainer, ProCard } from '@ant-design/pro-components';
import { useParams } from '@umijs/max';
import {
  App,
  Button,
  Descriptions,
  List,
  Progress,
  Space,
  Spin,
  Tag,
  Typography,
} from 'antd';
import React, { useCallback, useEffect, useState } from 'react';

import {
  cancelDownloadTaskApiTasksTaskIdCancelPost,
  exportTaskPdfApiTasksTaskIdPdfGet,
  getDownloadLinkApiTasksTaskIdDownloadLinkGet,
  getTaskApiTasksTaskIdGet,
  getTaskEventsApiTasksTaskIdEventsGet,
  retryDownloadTaskApiTasksTaskIdRetryPost,
} from '@/services/video/tasks';
import {
  canCancelTask,
  canExportPdf,
  canRetryTask,
  formatBytes,
  taskStateColor,
  taskStateLabel,
  taskTitle,
} from '@/services/workspace';

const TaskDetailPage: React.FC = () => {
  const { message } = App.useApp();
  const params = useParams<{ taskId: string }>();
  const taskId = params.taskId || '';
  const [task, setTask] = useState<API.TaskRead>();
  const [events, setEvents] = useState<API.TaskEventRead[]>([]);
  const [loading, setLoading] = useState(true);
  const [actionLoading, setActionLoading] = useState<string>();

  const loadTask = useCallback(async () => {
    if (!taskId) return;
    setLoading(true);
    try {
      const [taskData, eventData] = await Promise.all([
        getTaskApiTasksTaskIdGet({ task_id: taskId }),
        getTaskEventsApiTasksTaskIdEventsGet({ task_id: taskId }),
      ]);
      setTask(taskData);
      setEvents(eventData);
    } finally {
      setLoading(false);
    }
  }, [taskId]);

  useEffect(() => {
    void loadTask();
  }, [loadTask]);

  const runAction = async (key: string, action: () => Promise<void>) => {
    setActionLoading(key);
    try {
      await action();
    } finally {
      setActionLoading(undefined);
    }
  };

  const openDownloadLink = async () => {
    const result = await getDownloadLinkApiTasksTaskIdDownloadLinkGet({
      task_id: taskId,
    });
    window.open(result.url, '_blank', 'noopener,noreferrer');
  };

  const exportPdf = async () => {
    const result = await exportTaskPdfApiTasksTaskIdPdfGet(
      { task_id: taskId },
      { responseType: 'blob' },
    );
    const blob = result instanceof Blob ? result : new Blob([result]);
    const url = URL.createObjectURL(blob);
    window.open(url, '_blank', 'noopener,noreferrer');
  };

  if (loading && !task) {
    return (
      <PageContainer title="任务详情">
        <Spin />
      </PageContainer>
    );
  }

  return (
    <PageContainer
      title={task ? taskTitle(task) : '任务详情'}
      subTitle={task?.id}
      extra={
        <Space wrap>
          <Button
            icon={<StopOutlined />}
            disabled={!canCancelTask(task)}
            loading={actionLoading === 'cancel'}
            onClick={() =>
              runAction('cancel', async () => {
                await cancelDownloadTaskApiTasksTaskIdCancelPost({
                  task_id: taskId,
                });
                message.success('已提交取消任务请求');
                await loadTask();
              })
            }
          >
            取消
          </Button>
          <Button
            icon={<ReloadOutlined />}
            disabled={!canRetryTask(task)}
            loading={actionLoading === 'retry'}
            onClick={() =>
              runAction('retry', async () => {
                const nextTask = await retryDownloadTaskApiTasksTaskIdRetryPost({
                  task_id: taskId,
                });
                message.success('已创建重试任务');
                setTask(nextTask);
              })
            }
          >
            重试
          </Button>
          <Button
            icon={<DownloadOutlined />}
            disabled={!canExportPdf(task)}
            loading={actionLoading === 'download'}
            onClick={() =>
              runAction('download', async () => {
                await openDownloadLink();
              })
            }
          >
            下载文件
          </Button>
          <Button
            type="primary"
            icon={<FilePdfOutlined />}
            disabled={!canExportPdf(task)}
            loading={actionLoading === 'pdf'}
            onClick={() =>
              runAction('pdf', async () => {
                await exportPdf();
              })
            }
          >
            PDF 报告
          </Button>
        </Space>
      }
    >
      <ProCard className="video-page-card" split="vertical" gutter={16}>
        <ProCard colSpan="58%" ghost>
          <Descriptions column={1} bordered size="small">
            <Descriptions.Item label="状态">
              <Tag color={taskStateColor(task?.state)}>
                {taskStateLabel(task?.state)}
              </Tag>
            </Descriptions.Item>
            <Descriptions.Item label="进度">
              <Progress percent={task?.progress || 0} />
            </Descriptions.Item>
            <Descriptions.Item label="格式">
              {task?.format_label || task?.format_id || '-'}
            </Descriptions.Item>
            <Descriptions.Item label="文件大小">
              {formatBytes(task?.object_size)}
            </Descriptions.Item>
            <Descriptions.Item label="失败原因">
              {task?.failure_reason || '-'}
            </Descriptions.Item>
          </Descriptions>
        </ProCard>

        <ProCard title="事件日志" colSpan="42%">
          <List
            dataSource={events}
            locale={{ emptyText: '暂无事件' }}
            renderItem={(item) => (
              <List.Item>
                <Space orientation="vertical" size={4}>
                  <Typography.Text strong>
                    {taskStateLabel(item.state)}
                  </Typography.Text>
                  <Typography.Text type="secondary">
                    {item.message || item.created_at}
                  </Typography.Text>
                </Space>
              </List.Item>
            )}
          />
        </ProCard>
      </ProCard>
    </PageContainer>
  );
};

export default TaskDetailPage;
