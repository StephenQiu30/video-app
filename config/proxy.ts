export default {
  dev: {
    '/api/': {
      target: process.env.UMI_APP_API_BASE_URL || 'http://127.0.0.1:8000',
      changeOrigin: true,
    },
    '/health': {
      target: process.env.UMI_APP_API_BASE_URL || 'http://127.0.0.1:8000',
      changeOrigin: true,
    },
    '/ready': {
      target: process.env.UMI_APP_API_BASE_URL || 'http://127.0.0.1:8000',
      changeOrigin: true,
    },
  },
};
