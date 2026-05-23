export default [
  {
    path: '/',
    redirect: '/parser',
  },
  {
    path: '/parser',
    name: '解析下载',
    icon: 'CloudDownloadOutlined',
    component: './Parser',
  },
  {
    path: '/tasks',
    name: '下载任务',
    icon: 'UnorderedListOutlined',
    component: './Tasks',
  },
  {
    path: '/account',
    name: '账号中心',
    icon: 'UserOutlined',
    component: './Account',
  },
  {
    path: '/admin',
    name: '管理后台',
    icon: 'ControlOutlined',
    access: 'canAdmin',
    routes: [
      {
        path: '/admin',
        redirect: '/admin/users',
      },
      {
        path: '/admin/users',
        name: '用户管理',
        icon: 'TeamOutlined',
        component: './AdminUsers',
      },
      {
        path: '/admin/tasks',
        name: '任务监控',
        icon: 'DashboardOutlined',
        component: './AdminTasks',
      },
      {
        path: '/admin/system',
        name: '系统状态',
        icon: 'HeartOutlined',
        component: './AdminSystem',
      },
      {
        path: '/admin/platforms',
        name: '平台能力',
        icon: 'ClusterOutlined',
        component: './AdminPlatforms',
      },
    ],
  },
  {
    path: '/403',
    layout: false,
    component: './Exception/403',
  },
  {
    component: './Exception/404',
    layout: false,
    path: '*',
  },
];
