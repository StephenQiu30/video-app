declare module 'slash2';
declare module '*.css';
declare module '*.less';
declare module '*.scss';
declare module '*.sass';
declare module '*.svg';
declare module '*.png';
declare module '*.jpg';
declare module '*.jpeg';
declare module '*.gif';
declare module '*.bmp';
declare module '*.tiff';
declare module '*.md' {
  const content: string;
  export default content;
}

declare namespace API {
  type CurrentUser = {
    id?: number;
    email?: string;
    avatar_url?: string | null;
    display_name?: string | null;
    is_admin?: boolean;
  };
}

declare const __APP_VERSION__: string;
