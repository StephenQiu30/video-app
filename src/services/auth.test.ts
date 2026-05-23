import { request } from '@umijs/max';

import {
  TOKEN_STORAGE_KEY,
  authTokenStorage,
  consumeOAuthTokenFromSearch,
  loginWithPassword,
  logout,
} from './auth';

jest.mock('@umijs/max', () => ({
  request: jest.fn(),
}));

const mockedRequest = request as jest.Mock;

describe('auth service', () => {
  beforeEach(() => {
    localStorage.clear();
    mockedRequest.mockReset();
  });

  it('stores the JWT returned by password login', async () => {
    mockedRequest.mockResolvedValueOnce({
      access_token: 'jwt-token',
      token_type: 'bearer',
    });

    await expect(
      loginWithPassword({ email: 'USER@example.com', password: 'secret' }),
    ).resolves.toEqual({ access_token: 'jwt-token', token_type: 'bearer' });

    expect(mockedRequest).toHaveBeenCalledWith('/api/auth/login', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      data: { email: 'USER@example.com', password: 'secret' },
    });
    expect(localStorage.getItem(TOKEN_STORAGE_KEY)).toBe('jwt-token');
  });

  it('consumes OAuth callback token from query string', () => {
    expect(consumeOAuthTokenFromSearch('?token=oauth-token&next=/parser')).toBe(
      'oauth-token',
    );
    expect(authTokenStorage.get()).toBe('oauth-token');
  });

  it('clears token on logout', () => {
    authTokenStorage.set('jwt-token');

    logout();

    expect(localStorage.getItem(TOKEN_STORAGE_KEY)).toBeNull();
  });
});
