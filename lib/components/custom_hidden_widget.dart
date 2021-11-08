// import 'package:flutter/material.dart';
//
// class SliverHidedHeader extends SingleChildRenderObjectWidget {
//   const SliverHidedHeader({
//     Key? key,
//     required Widget child,
//   }) : super(key: key, child: child);
//
//   @override
//   RenderSliverToBoxAdapter createRenderObject(BuildContext context) {
//     return RenderSliverHidedHeader(context: context);
//   }
// }
//
// class RenderSliverHidedHeader extends RenderSliverSingleBoxAdapter {
//   RenderSliverHidedHeader({
//     required BuildContext context,
//     RenderBox? child,
//   })  : _context = context,
//         super(child: child);
//
//   /// Whether we need to apply a correction to the scroll
//   /// offset during the next layout
//   ///
//   ///
//   /// This is useful to avoid the viewport to jump when we
//   /// insert/remove the child.
//   ///
//   /// If [showChild] is true, its an insert
//   /// If [showChild] is false, its a removal
//   bool _correctScrollOffsetNextLayout = true;
//
//   /// Whether [child] should be shown
//   ///
//   ///
//   /// This is used to hide the child when the user scrolls down
//   bool _showChild = true;
//
//   /// The context is used to get the [Scrollable]
//   BuildContext _context;
//
//   @override
//   void performLayout() {
//     if (child == null) {
//       geometry = SliverGeometry.zero;
//       return;
//     }
//     final SliverConstraints constraints = this.constraints;
//     child!.layout(constraints.asBoxConstraints(), parentUsesSize: true);
//     final double childExtent;
//     switch (constraints.axis) {
//       case Axis.horizontal:
//         childExtent = child!.size.width;
//         break;
//       case Axis.vertical:
//         childExtent = child!.size.height;
//         break;
//     }
//     final double paintedChildSize =
//         calculatePaintOffset(constraints, from: 0.0, to: childExtent);
//     final double cacheExtent =
//         calculateCacheOffset(constraints, from: 0.0, to: childExtent);
//
//     assert(paintedChildSize.isFinite);
//     assert(paintedChildSize >= 0.0);
//
//     // Here are the few custom lines, which use [scrollOffsetCorrection]
//     // to remove the child size
//     //
//     // Note that this should only be called for correction linked with the
//     // insertion (NOT the removal)
//     if (_correctScrollOffsetNextLayout) {
//       geometry = SliverGeometry(scrollOffsetCorrection: childExtent);
//       _correctScrollOffsetNextLayout = false;
//       return;
//     }
//
//     // Subscribe a listener to the scroll notifier
//     // which will snap if needed
//     _manageSnapEffect(
//       childExtent: childExtent,
//       paintedChildSize: paintedChildSize,
//     );
//
//     // Subscribe a listener to the scroll notifier
//     // which hide the child if needed
//     _manageInsertChild(
//       childExtent: childExtent,
//       paintedChildSize: paintedChildSize,
//     );
//
//     geometry = SliverGeometry(
//       scrollExtent: childExtent,
//       paintExtent: paintedChildSize,
//       paintOrigin: _showChild ? 0 : -paintedChildSize,
//       layoutExtent: _showChild ? null : 0,
//       cacheExtent: cacheExtent,
//       maxPaintExtent: childExtent,
//       hitTestExtent: paintedChildSize,
//       hasVisualOverflow: childExtent > constraints.remainingPaintExtent ||
//           constraints.scrollOffset > 0.0,
//     );
//     setChildParentData(child!, constraints, geometry!);
//   }
//
//   /// Override to remove the listeners if needed
//   @override
//   void dispose() {
//     final _scrollPosition = Scrollable.of(_context)!.position;
//     if (_subscribedSnapScrollNotifierListener != null) {
//       _scrollPosition.isScrollingNotifier
//           .removeListener(_subscribedSnapScrollNotifierListener!);
//     }
//     if (_subscribedInsertChildScrollNotifierListener != null) {
//       _scrollPosition.isScrollingNotifier
//           .removeListener(_subscribedInsertChildScrollNotifierListener!);
//     }
//
//     super.dispose();
//   }
//
//   /// The listener which will snap if needed
//   ///
//   ///
//   /// We store it to be able to remove it before subscribing
//   /// a new one
//   void Function()? _subscribedSnapScrollNotifierListener;
//
//   /// Handles the subscription and removal of subscription to
//   /// the scrollable position notifier which are responsible
//   /// for the snapping effect
//   ///
//   ///
//   /// This must be called at each [performLayout] to ensure that the
//   /// [childExtent] and [paintedChildSize] parameters are up to date
//   _manageSnapEffect({
//     required double childExtent,
//     required double paintedChildSize,
//   }) {
//     final _scrollPosition = Scrollable.of(_context)!.position;
//
//     // If we were subscribed with previous value, remove the subscription
//     if (_subscribedSnapScrollNotifierListener != null) {
//       _scrollPosition.isScrollingNotifier
//           .removeListener(_subscribedSnapScrollNotifierListener!);
//     }
//
//     // We store the subscription to be able to remove it
//     _subscribedSnapScrollNotifierListener = () => _snapScrollNotifierListener(
//           childExtent: childExtent,
//           paintedChildSize: paintedChildSize,
//         );
//     _scrollPosition.isScrollingNotifier
//         .addListener(_subscribedSnapScrollNotifierListener!);
//   }
//
//   /// Snaps if the user just stopped scrolling and the child is
//   /// partially visible
//   void _snapScrollNotifierListener({
//     required double childExtent,
//     required double paintedChildSize,
//   }) {
//     final _scrollPosition = Scrollable.of(_context)!.position;
//
//     // Whether the user is currently idle (i.e not scrolling)
//     //
//     // We don't check _scrollPosition.activity.isScrolling or
//     // _scrollPosition.isScrollingNotifier.value because even if
//     // the user is holding still we don't want to start animating
//     //
//     // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
//     final isIdle = _scrollPosition.activity is IdleScrollActivity;
//
//     // Whether at least part of the child is visible
//     final isChildVisible = paintedChildSize > 0;
//
//     if (isIdle && isChildVisible) {
//       // If more than half is visible, snap to see everything
//       if (paintedChildSize >= childExtent / 2 &&
//           paintedChildSize != childExtent) {
//         _scrollPosition.animateTo(
//           0,
//           duration: Duration(milliseconds: 100),
//           curve: Curves.easeOut,
//         );
//       }
//
//       // If less than half is visible, snap to hide
//       else if (paintedChildSize < childExtent / 2 && paintedChildSize != 0) {
//         _scrollPosition.animateTo(
//           childExtent,
//           duration: Duration(milliseconds: 200),
//           curve: Curves.easeOut,
//         );
//       }
//     }
//   }
//
//   /// The listener which will hide the child if needed
//   ///
//   ///
//   /// We store it to be able to remove it before subscribing
//   /// a new one
//   void Function()? _subscribedInsertChildScrollNotifierListener;
//
//   /// Handles the subscription and removal of subscription to
//   /// the scrollable position notifier which are responsible
//   /// for inserting/removing the child if needed
//   ///
//   ///
//   /// This must be called at each [performLayout] to ensure that the
//   /// [childExtent] and [paintedChildSize] parameters are up to date
//   void _manageInsertChild({
//     required double childExtent,
//     required double paintedChildSize,
//   }) {
//     final _scrollPosition = Scrollable.of(_context)!.position;
//
//     // If we were subscribed with previous value, remove the subscription
//     if (_subscribedInsertChildScrollNotifierListener != null) {
//       _scrollPosition.isScrollingNotifier
//           .removeListener(_subscribedInsertChildScrollNotifierListener!);
//     }
//
//     // We store the subscription to be able to remove it
//     _subscribedInsertChildScrollNotifierListener =
//         () => _insertChildScrollNotifierListener(
//               childExtent: childExtent,
//               paintedChildSize: paintedChildSize,
//             );
//     _scrollPosition.isScrollingNotifier
//         .addListener(_subscribedInsertChildScrollNotifierListener!);
//   }
//
//   /// When [ScrollPosition.isScrollingNotifier] fires:
//   ///   - If the viewport is at the top and the child is not visible,
//   ///   ^ insert the child
//   ///   - If the viewport is NOT at the top and the child is NOT visible,
//   ///   ^ remove the child
//   void _insertChildScrollNotifierListener({
//     required double childExtent,
//     required double paintedChildSize,
//   }) {
//     final _scrollPosition = Scrollable.of(_context)!.position;
//
//     final isScrolling = _scrollPosition.isScrollingNotifier.value;
//
//     // If the user is still scrolling, do nothing
//     if (isScrolling) {
//       return;
//     }
//
//     final scrollOffset = _scrollPosition.pixels;
//
//     // If the viewport is at the top and the child is not visible,
//     // insert the child
//     //
//     // We use 0.1 as a small value in case the user is nearly scrolled
//     // all the way up
//     if (!_showChild && scrollOffset <= 0.1) {
//       _showChild = true;
//       _correctScrollOffsetNextLayout = true;
//       markNeedsLayout();
//     }
//
//     // There is sometimes an issue with [ClampingScrollPhysics] where
//     // the child is NOT shown but the scroll offset still includes [childExtent]
//     //
//     // There is no why to detect it but we always insert the child when all
//     // this conditions are united.
//     // This means that if a user as [ClampingScrollPhysics] and stops scrolling
//     // exactly at [childExtent], the child will be wrongfully inserted. However
//     // this seems a small price to pay to avoid the issue.
//     if (_scrollPosition.physics
//         .containsScrollPhysicsOfType<ClampingScrollPhysics>()) {
//       if (!_showChild && scrollOffset == childExtent) {
//         _showChild = true;
//         markNeedsLayout();
//       }
//     }
//
//     // If the viewport is NOT at the top and the child is NOT visible,
//     // remove the child
//     if (_showChild && scrollOffset > childExtent) {
//       _showChild = false;
//       markNeedsLayout();
//
//       // We don't have to correct the scroll offset here, no idea why
//     }
//   }
// }
//
// /// An extension on [ScrollPhysics] to check if it or its
// /// parent are the given [ScrollPhysics]
// extension _ScrollPhysicsExtension on ScrollPhysics {
//   /// Check the type of this [ScrollPhysics] and its parents and return
//   /// true if any is of type [T]
//   bool containsScrollPhysicsOfType<T extends ScrollPhysics>() {
//     return this is T || (parent?.containsScrollPhysicsOfType<T>() ?? false);
//   }
// }
