// @ts-ignore
/* eslint-disable */
import { request } from "@umijs/max";

/** Github Authorize GET /api/auth/github/authorize */
export async function githubAuthorizeApiAuthGithubAuthorizeGet(options?: {
  [key: string]: any;
}) {
  return request<any>("/api/auth/github/authorize", {
    method: "GET",
    ...(options || {}),
  });
}

/** Github Callback GET /api/auth/github/callback */
export async function githubCallbackApiAuthGithubCallbackGet(
  // 叠加生成的Param类型 (非body参数swagger默认没有生成对象)
  params: API.githubCallbackApiAuthGithubCallbackGetParams,
  options?: { [key: string]: any }
) {
  return request<any>("/api/auth/github/callback", {
    method: "GET",
    params: {
      ...params,
    },
    ...(options || {}),
  });
}

/** Login User POST /api/auth/login */
export async function loginUserApiAuthLoginPost(
  body: API.UserLogin,
  options?: { [key: string]: any }
) {
  return request<API.Token>("/api/auth/login", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    data: body,
    ...(options || {}),
  });
}

/** Get Me GET /api/auth/me */
export async function getMeApiAuthMeGet(options?: { [key: string]: any }) {
  return request<API.UserRead>("/api/auth/me", {
    method: "GET",
    ...(options || {}),
  });
}

/** Register User POST /api/auth/register */
export async function registerUserApiAuthRegisterPost(
  body: API.UserCreate,
  options?: { [key: string]: any }
) {
  return request<API.Token>("/api/auth/register", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    data: body,
    ...(options || {}),
  });
}
