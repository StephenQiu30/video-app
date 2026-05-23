import {
  getMeApiAuthMeGet,
  loginUserApiAuthLoginPost,
} from './video/auth';

export const TOKEN_STORAGE_KEY = 'video_web_access_token';

export const authTokenStorage = {
  get() {
    return localStorage.getItem(TOKEN_STORAGE_KEY);
  },
  set(token: string) {
    localStorage.setItem(TOKEN_STORAGE_KEY, token);
  },
  clear() {
    localStorage.removeItem(TOKEN_STORAGE_KEY);
  },
};

export async function loginWithPassword(payload: API.UserLogin) {
  const token = await loginUserApiAuthLoginPost(payload);
  authTokenStorage.set(token.access_token);
  return token;
}

export async function fetchCurrentUser() {
  return getMeApiAuthMeGet({ skipErrorHandler: true });
}

export function consumeOAuthTokenFromSearch(search: string) {
  const token = new URLSearchParams(search).get('token');
  if (token) {
    authTokenStorage.set(token);
  }
  return token;
}

export function logout() {
  authTokenStorage.clear();
}
