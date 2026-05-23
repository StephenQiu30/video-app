import access from './access';

describe('access control', () => {
  it('allows admins to enter admin routes', () => {
    expect(access({ currentUser: { is_admin: true } }).canAdmin).toBe(true);
  });

  it('blocks non-admin users from admin routes', () => {
    expect(access({ currentUser: { is_admin: false } }).canAdmin).toBe(false);
    expect(access({}).canAdmin).toBe(false);
  });
});
