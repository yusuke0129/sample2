export default function ({ store, route, redirect }) {
  let access_path = route.path.substr(0, 7)
  if (!store.state.auth && access_path === "/signup") {
    return redirect("/")
  }
}
