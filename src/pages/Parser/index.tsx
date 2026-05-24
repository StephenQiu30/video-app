import {
  CloudDownloadOutlined,
  LinkOutlined,
  SafetyCertificateOutlined,
} from '@ant-design/icons';
import {
  PageContainer,
  ProCard,
  ProForm,
  ProFormText,
} from '@ant-design/pro-components';
import { history, useLocation, useModel } from '@umijs/max';
import {
  App,
  Button,
  Descriptions,
  Empty,
  Image,
  Radio,
  Space,
  Tag,
  Typography,
} from 'antd';
import React, { useCallback, useEffect, useRef, useState } from 'react';

import AuthModal from '@/components/AuthModal';
import { parseVideoApiParsePost } from '@/services/video/parse';
import { createTaskApiTasksPost } from '@/services/video/tasks';

type InitialStateModel = {
  initialState?: {
    currentUser?: API.UserRead;
  };
};

const ParserPage: React.FC = () => {
  const { message } = App.useApp();
  const location = useLocation();
  const { initialState } = useModel(
    '@@initialState',
  ) as unknown as InitialStateModel;
  const currentUser = initialState?.currentUser;
  const [parseResult, setParseResult] = useState<API.ParseResponse>();
  const [sourceUrl, setSourceUrl] = useState('');
  const [formatId, setFormatId] = useState<string>();
  const [creating, setCreating] = useState(false);
  const [authModalOpen, setAuthModalOpen] = useState(false);
  const pendingParseUrlRef = useRef<string | undefined>(undefined);
  const pendingParseInFlightRef = useRef(false);
  const pendingCreateRef = useRef(false);
  const pendingCreateInFlightRef = useRef(false);

  const selectedFormat = parseResult?.formats.find(
    (format) => format.format_id === formatId,
  );

  const clearLoginQuery = useCallback(() => {
    const searchParams = new URLSearchParams(location.search);
    if (!searchParams.has('login')) {
      return;
    }

    searchParams.delete('login');
    const nextSearch = searchParams.toString();
    history.replace({
      pathname: location.pathname,
      search: nextSearch ? `?${nextSearch}` : '',
      hash: location.hash,
    });
  }, [location.hash, location.pathname, location.search]);

  const runParse = useCallback(
    async (url: string) => {
      const result = await parseVideoApiParsePost({ url });
      setParseResult(result);
      setFormatId(result.formats[0]?.format_id);
      message.success('解析完成');
    },
    [message],
  );

  const createDownloadTask = useCallback(async () => {
    if (!parseResult) return;

    setCreating(true);
    try {
      const task = await createTaskApiTasksPost({
        url: parseResult.url || sourceUrl,
        format_id: formatId,
        format_label: selectedFormat?.label,
        title: parseResult.title,
        cover_url: parseResult.cover_url,
        duration_seconds: parseResult.duration_seconds,
      });
      message.success('下载任务已创建');
      history.push(`/tasks/${task.id}`);
    } catch {
      message.error('创建任务失败，请稍后重试');
    } finally {
      setCreating(false);
    }
  }, [formatId, message, parseResult, selectedFormat?.label, sourceUrl]);

  useEffect(() => {
    const loginRequested =
      new URLSearchParams(location.search).get('login') === '1';
    if (!loginRequested) {
      return;
    }

    if (currentUser) {
      clearLoginQuery();
      return;
    }

    setAuthModalOpen(true);
  }, [clearLoginQuery, currentUser, location.search]);

  const handleParseSubmit = async ({ url }: { url: string }) => {
    setSourceUrl(url);
    if (!currentUser) {
      pendingParseUrlRef.current = url;
      setAuthModalOpen(true);
      return true;
    }

    await runParse(url);
    return true;
  };

  const handleAuthSuccess = async () => {
    clearLoginQuery();

    const url = pendingParseUrlRef.current;
    if (url && !pendingParseInFlightRef.current) {
      pendingParseUrlRef.current = undefined;
      pendingParseInFlightRef.current = true;

      try {
        await runParse(url);
      } finally {
        pendingParseInFlightRef.current = false;
      }
      return;
    }

    if (pendingCreateRef.current && !pendingCreateInFlightRef.current) {
      pendingCreateRef.current = false;
      pendingCreateInFlightRef.current = true;
      try {
        await createDownloadTask();
      } finally {
        pendingCreateInFlightRef.current = false;
      }
    }
  };

  const createTask = async () => {
    if (!parseResult) return;
    if (!currentUser) {
      pendingCreateRef.current = true;
      setAuthModalOpen(true);
      return;
    }

    await createDownloadTask();
  };

  const handleAuthCancel = () => {
    setAuthModalOpen(false);
    clearLoginQuery();
  };

  return (
    <PageContainer
      title="解析下载"
      subTitle="粘贴公开视频链接，解析格式后创建下载任务"
    >
      <ProCard className="video-page-card" split="vertical" gutter={24}>
        <ProCard colSpan="54%" ghost>
          <ProForm<{ url: string }>
            layout="vertical"
            submitter={{
              searchConfig: { submitText: '解析链接' },
              render: (_, dom) => dom.pop(),
            }}
            onFinish={handleParseSubmit}
          >
            <ProFormText
              name="url"
              label="视频链接"
              placeholder="粘贴 B 站、抖音、快手等公开视频分享链接"
              fieldProps={{ prefix: <LinkOutlined /> }}
              rules={[{ required: true, message: '请输入视频链接' }]}
            />
          </ProForm>

          <Space wrap>
            <Tag color="blue">公开链接解析</Tag>
            <Tag color="green">格式选择</Tag>
            <Tag color="gold">任务队列</Tag>
            <Tag color="purple">PDF 报告</Tag>
          </Space>
        </ProCard>

        <ProCard title="能力边界" colSpan="46%">
          <Space orientation="vertical" size={12}>
            <Typography.Text>
              <SafetyCertificateOutlined
                style={{ color: '#1677ff', marginRight: 8 }}
              />
              仅处理用户有权保存的公开或授权内容。
            </Typography.Text>
            <Typography.Text type="secondary">
              不提供 DRM、付费墙或平台访问控制绕过能力。
            </Typography.Text>
          </Space>
        </ProCard>
      </ProCard>

      <ProCard
        className="video-page-card"
        title="解析结果"
        style={{ marginTop: 16 }}
        extra={
          <Button
            type="primary"
            icon={<CloudDownloadOutlined />}
            disabled={!parseResult}
            loading={creating}
            onClick={createTask}
          >
            创建下载任务
          </Button>
        }
      >
        {!parseResult ? (
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description="等待解析链接" />
        ) : (
          <Space align="start" size={24} wrap>
            {parseResult.cover_url ? (
              <Image
                width={180}
                src={parseResult.cover_url}
                alt={parseResult.title || '视频封面'}
                style={{ borderRadius: 8 }}
              />
            ) : null}

            <Space orientation="vertical" size={16} style={{ minWidth: 320 }}>
              <Descriptions column={1} size="small">
                <Descriptions.Item label="标题">
                  {parseResult.title || '-'}
                </Descriptions.Item>
                <Descriptions.Item label="平台">
                  {parseResult.source_site || parseResult.platform_id || '-'}
                </Descriptions.Item>
                <Descriptions.Item label="合规提示">
                  {parseResult.compliance_note || '请确认你有权保存该内容。'}
                </Descriptions.Item>
              </Descriptions>

              <Radio.Group
                value={formatId}
                onChange={(event) => setFormatId(event.target.value)}
              >
                <Space wrap>
                  {parseResult.formats.map((format) => (
                    <Radio.Button
                      key={format.format_id}
                      value={format.format_id}
                      disabled={!format.available}
                    >
                      {format.label}
                    </Radio.Button>
                  ))}
                </Space>
              </Radio.Group>
            </Space>
          </Space>
        )}
      </ProCard>
      <AuthModal
        open={authModalOpen}
        onCancel={handleAuthCancel}
        onSuccess={handleAuthSuccess}
      />
    </PageContainer>
  );
};

export default ParserPage;
