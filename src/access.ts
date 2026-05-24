export default function access(
  initialState: { currentUser?: API.CurrentUser } | undefined,
) {
  const { currentUser } = initialState ?? {};
  return {
    canAuthenticated: Boolean(currentUser),
    canAdmin: currentUser?.is_admin === true,
  };
}
