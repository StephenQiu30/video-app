import type { ProLayoutProps } from '@ant-design/pro-components';

const Settings: ProLayoutProps & {
  logo?: string;
} = {
  navTheme: 'light',
  colorPrimary: '#1677ff',
  layout: 'mix',
  contentWidth: 'Fluid',
  fixedHeader: true,
  fixSiderbar: true,
  colorWeak: false,
  title: '万能视频下载器',
  logo: '/logo.svg',
  iconfontUrl: '',
  token: {
    header: {
      colorBgHeader: '#ffffff',
      colorHeaderTitle: '#101828',
      colorTextMenu: '#475467',
      colorTextMenuSelected: '#1677ff',
      colorBgMenuItemSelected: 'rgba(22, 119, 255, 0.08)',
    },
    sider: {
      colorMenuBackground: '#ffffff',
      colorTextMenu: '#475467',
      colorTextMenuSelected: '#1677ff',
      colorBgMenuItemSelected: 'rgba(22, 119, 255, 0.08)',
    },
    pageContainer: {
      colorBgPageContainer: '#f5f8fc',
    },
  },
};

export default Settings;
