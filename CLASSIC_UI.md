# FlClash Classic Android layout

This fork keeps upstream Go/mihomo, Dart core bindings, Riverpod state,
configuration features, and platform services. Only the Android phone
presentation is adapted toward a thumb-reachable Material layout.

## Differences from upstream

- Android uses the existing fixed bottom `NavigationBar` (64 dp height),
  instead of the floating dock. The existing floating-dock preference is
  intentionally ignored on Android; other platforms are unaffected.
- The proxy tab keeps upstream `delayTestCurrentGroup()` logic, but exposes
  it via a bottom-right FAB. Busy state disables the button and searching
  hides it. Desktop and proxy picker sheets keep their toolbar button.
- The profile page keeps `AddProfileMenu` (link/file/QR/custom) and exposes
  it via a bottom-right FAB when profiles exist. The empty-state add button
  and picker sheets remain unchanged.
- Android profile and proxy cards use less rounded corners and tighter
  spacing. Mobile dashboard card gaps are capped at 8 dp.
- Scrollable lists reserve bottom space so FABs do not obscure the last item.
- The small `lib/classic_ui/classic_fab_overlay.dart` adapter is intentionally
  separate from upstream's shared `lib/ui/scaffold.dart`.

## Sync with upstream

```sh
git remote add upstream https://github.com/chen08209/FlClash.git
git fetch upstream
git merge upstream/main
git submodule update --init --recursive
dart setup.dart android
```

Merge upstream business, provider, core and native work without reverting to
old APIs. If upstream changes the proxy or profile UI call sites, update the
thin classic entry points rather than copying old page implementations.

## Checklist for Android and CI

- Confirm fixed bottom navigation, switching and back navigation.
- Verify proxy FAB delay testing, disabled busy state, searching, selector
  mode, list mode, proxy picker and the last item of a long proxy list.
- Verify add-profile FAB opens all upstream import methods, empty-state
  action, selection/editing, and access to the last profile.
- Check no overlapping UI with system navigation, keyboard or docked search.
- Check desktop remains unchanged, then test VPN/TUN, core lifecycle,
  profile refresh and rule updates.
- Run `flutter analyze`, `flutter test` and `dart setup.dart android`
  in a Flutter/Android build environment.
