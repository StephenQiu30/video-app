import { DownloadOutlined, ReloadOutlined } from '@ant-design/icons';
import ProCard from '@ant-design/pro-components/es/card';
import { PageContainer } from '@ant-design/pro-components/es/layout';
import { Alert, Button, Flex, Form, Input, Result, Typography } from 'antd';
import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import LegalNotice from '@/components/LegalNotice';
import { validateVideoUrl } from '@/utils/url';
import FormatList from './components/FormatList';
import MediaSummary from './components/MediaSummary';
import { useInspectFlow } from './hooks';

export default function DownloadPage() {
  const navigate = useNavigate();
  const [url, setUrl] = useState('');
  const [validationError, setValidationError] = useState<string | null>(null);
  const {
    state,
    media,
    selectedFormatId,
    setSelectedFormatId,
    problem,
    createProblem,
    inspect,
    createDownload,
    isInspecting,
    isCreating,
  } = useInspectFlow();

  const submitInspect = () => {
    const error = validateVideoUrl(url);
    setValidationError(error);
    if (!error) void inspect(url.trim());
  };

  const selectedFormat =
    media?.formats.find((format) => format.id === selectedFormatId) ?? null;
  const create = async () => {
    const jobId = await createDownload(selectedFormat);
    if (jobId) navigate(`/downloads/${encodeURIComponent(jobId)}`);
  };

  return (
    <PageContainer
      title="公开视频下载器"
      subTitle="输入公开视频链接，解析后选择可用的清晰度。"
    >
      <main className="pro-content">
        <ProCard title="解析视频" variant="outlined" headerBordered>
          <Form layout="vertical" onFinish={submitInspect}>
            <Form.Item
              label="视频链接"
              validateStatus={validationError ? 'error' : undefined}
            >
              <Input
                aria-label="视频链接"
                placeholder="粘贴公开视频链接"
                value={url}
                status={validationError ? 'error' : undefined}
                onChange={(event) => {
                  setUrl(event.target.value);
                  if (validationError) setValidationError(null);
                }}
                onPressEnter={(event) => {
                  event.preventDefault();
                  submitInspect();
                }}
                disabled={isInspecting}
              />
            </Form.Item>
            {validationError ? (
              <Typography.Text type="danger">{validationError}</Typography.Text>
            ) : null}
            <Form.Item>
              <Button
                type="primary"
                icon={<DownloadOutlined />}
                loading={isInspecting}
                onClick={submitInspect}
              >
                {isInspecting ? '正在解析视频' : '解析视频'}
              </Button>
            </Form.Item>
          </Form>
          <LegalNotice />
        </ProCard>

        {state === 'inspect_failed' && problem ? (
          <ProCard style={{ marginTop: 16 }} variant="outlined">
            <Result
              status="error"
              title={problem.title}
              subTitle={problem.detail}
              extra={
                <Button icon={<ReloadOutlined />} onClick={submitInspect}>
                  重新解析
                </Button>
              }
            />
          </ProCard>
        ) : null}
        {state === 'expired' ? (
          <Alert
            style={{ marginTop: 16 }}
            type="warning"
            showIcon
            title="解析结果已过期"
            description="请重新解析链接后再选择清晰度。"
            action={<Button onClick={submitInspect}>重新解析</Button>}
          />
        ) : null}
        {state === 'inspected' && media ? (
          <Flex vertical gap={16} style={{ marginTop: 16 }} aria-live="polite">
            <MediaSummary media={media} />
            <ProCard title="选择清晰度" variant="outlined" headerBordered>
              <FormatList
                formats={media.formats}
                value={selectedFormatId}
                onChange={setSelectedFormatId}
              />
              <Button
                type="primary"
                block
                style={{ marginTop: 16 }}
                disabled={!selectedFormat}
                loading={isCreating}
                onClick={create}
              >
                {isCreating ? '正在创建任务' : '开始下载'}
              </Button>
              {createProblem ? (
                <Alert
                  style={{ marginTop: 12 }}
                  type="error"
                  showIcon
                  title={createProblem.title}
                  description={createProblem.detail}
                />
              ) : null}
            </ProCard>
          </Flex>
        ) : null}
      </main>
    </PageContainer>
  );
}
