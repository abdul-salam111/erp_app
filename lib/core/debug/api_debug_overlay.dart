import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../di/app_dependencies.dart';
import '../../routes/routes.dart';
import '../theme/theme_exports.dart';
import 'cubit/api_debug_cubit.dart';
import 'api_debug_entry.dart';
import 'cubit/api_debug_state.dart';

// ─── Root layer ───────────────────────────────────────────────────────────────

class ApiDebugLayer extends StatelessWidget {
  const ApiDebugLayer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<ApiDebugCubit>(),
      child: _ApiDebugLayerBody(child: child),
    );
  }
}

class _ApiDebugLayerBody extends StatefulWidget {
  const _ApiDebugLayerBody({required this.child});
  final Widget child;

  @override
  State<_ApiDebugLayerBody> createState() => _ApiDebugLayerBodyState();
}

class _ApiDebugLayerBodyState extends State<_ApiDebugLayerBody> {
  Offset? _position;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        BlocBuilder<ApiDebugCubit, ApiDebugState>(
          builder: (context, state) {
            if (!state.isEnabled) return const SizedBox.shrink();
            final size = MediaQuery.sizeOf(context);
            _position ??= Offset(size.width - 80, size.height - 160);
            return Positioned(
              left: _position!.dx,
              top: _position!.dy,
              child: GestureDetector(
                onPanUpdate: (d) {
                  setState(() {
                    _position = Offset(
                      (_position!.dx + d.delta.dx).clamp(0.0, size.width - 72),
                      (_position!.dy + d.delta.dy).clamp(0.0, size.height - 72),
                    );
                  });
                },
                onTap: () => _openListSheet(context),
                child: _FabContent(state: state),
              ),
            );
          },
        ),
      ],
    );
  }

  void _openListSheet(BuildContext context) {
    final navContext = AppRoutes.navigatorKey.currentContext;
    if (navContext == null) return;
    final cubit = context.read<ApiDebugCubit>();
    showModalBottomSheet<void>(
      context: navContext,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: const _DebugListSheet(),
      ),
    );
  }
}

// ─── FAB visual ──────────────────────────────────────────────────────────────

class _FabContent extends StatelessWidget {
  const _FabContent({required this.state});
  final ApiDebugState state;

  @override
  Widget build(BuildContext context) {
    final hasPending = state.pendingCount > 0;
    final accent = hasPending ? Colors.amberAccent : Colors.greenAccent;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 60,
          height: 30,
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A2E),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.35),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Icon(
                hasPending ? Icons.sync_rounded : Icons.api_rounded,
                color: accent,
                size: 15,
              ),
            ],
          ),
        ),
        Positioned(
          top: -6,
          right: -6,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(color: accent, shape: BoxShape.circle),
            child: Text(
              '${state.entries.length}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 9,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── List sheet ───────────────────────────────────────────────────────────────

class _DebugListSheet extends StatelessWidget {
  const _DebugListSheet();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      minChildSize: 0.35,
      maxChildSize: 0.93,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFF1A1A2E),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              const _SheetHandle(),
              const _SheetHeader(),
              const _SimulateTokenRow(),
              const Divider(color: Colors.white12, height: 1),
              const _ColumnHeaders(),
              const Divider(color: Colors.white12, height: 1),
              Expanded(child: _EntryList(scrollController: scrollController)),
            ],
          ),
        );
      },
    );
  }
}

class _SheetHandle extends StatelessWidget {
  const _SheetHandle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 4),
        width: 36,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

class _SheetHeader extends StatelessWidget {
  const _SheetHeader();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiDebugCubit, ApiDebugState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 8, 4),
          child: Row(
            children: [
              Icon(
                state.pendingCount > 0 ? Icons.sync_rounded : Icons.api_rounded,
                color: state.pendingCount > 0 ? Colors.amberAccent : Colors.greenAccent,
                size: 18,
              ),
              const SizedBox(width: 8),
              const Text(
                'API Debugger',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${state.entries.length}',
                  style: const TextStyle(color: Colors.white70, fontSize: 11),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => context.read<ApiDebugCubit>().clearEntries(),
                child: const Text('Clear', style: TextStyle(color: Colors.redAccent, fontSize: 13)),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SimulateTokenRow extends StatelessWidget {
  const _SimulateTokenRow();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiDebugCubit, ApiDebugState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          child: Row(
            children: [
              const Text(
                'Simulate Expired Token',
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
              const Spacer(),
              Switch(
                value: state.simulateExpiredToken,
                onChanged: (_) => context.read<ApiDebugCubit>().toggleSimulateExpiredToken(),
                activeThumbColor: Colors.amberAccent,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                inactiveThumbColor: AppColors.chartPrimary,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ColumnHeaders extends StatelessWidget {
  const _ColumnHeaders();

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w600, letterSpacing: 0.5);
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      child: Row(
        children: [
          SizedBox(width: 52, child: Text('METHOD', style: style)),
          Expanded(child: Text('ENDPOINT', style: style)),
          SizedBox(width: 40, child: Text('CODE', style: style, textAlign: TextAlign.center)),
          SizedBox(width: 48, child: Text('TIME', style: style, textAlign: TextAlign.right)),
        ],
      ),
    );
  }
}

class _EntryList extends StatelessWidget {
  const _EntryList({required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiDebugCubit, ApiDebugState>(
      builder: (context, state) {
        if (state.entries.isEmpty) {
          return const Center(
            child: Text('No API calls yet', style: TextStyle(color: Colors.white38, fontSize: 13)),
          );
        }
        return ListView.separated(
          controller: scrollController,
          itemCount: state.entries.length,
          separatorBuilder: (_, __) => const Divider(color: Colors.white12, height: 1),
          itemBuilder: (context, i) => _EntryRow(entry: state.entries[i]),
        );
      },
    );
  }
}

// ─── Entry row ────────────────────────────────────────────────────────────────

class _EntryRow extends StatelessWidget {
  const _EntryRow({required this.entry});
  final ApiDebugEntry entry;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openDetail(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            SizedBox(
              width: 52,
              child: _MethodBadge(method: entry.method),
            ),
            Expanded(
              child: Text(
                entry.shortPath,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: 40,
              child: Center(child: _StatusBadge(entry: entry)),
            ),
            SizedBox(
              width: 48,
              child: Text(
                entry.elapsedLabel,
                style: const TextStyle(color: Colors.white38, fontSize: 11),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openDetail(BuildContext context) {
    final cubit = context.read<ApiDebugCubit>();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: _DebugDetailSheet(entry: entry),
      ),
    );
  }
}

class _MethodBadge extends StatelessWidget {
  const _MethodBadge({required this.method});
  final String method;

  @override
  Widget build(BuildContext context) {
    final color = switch (method.toUpperCase()) {
      'GET'    => Colors.greenAccent,
      'POST'   => Colors.blueAccent,
      'PUT'    => Colors.orangeAccent,
      'PATCH'  => Colors.purpleAccent,
      'DELETE' => Colors.redAccent,
      _        => Colors.white54,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        method.toUpperCase(),
        style: TextStyle(color: color, fontSize: 9, fontWeight: FontWeight.w700, letterSpacing: 0.3),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.entry});
  final ApiDebugEntry entry;

  @override
  Widget build(BuildContext context) {
    if (!entry.isCompleted) {
      return const Text('…', style: TextStyle(color: Colors.amberAccent, fontSize: 12));
    }
    final code = entry.statusCode;
    final color = entry.isError || (code != null && code >= 400)
        ? Colors.redAccent
        : Colors.greenAccent;
    return Text(
      code?.toString() ?? '—',
      style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600),
    );
  }
}

// ─── Detail sheet ─────────────────────────────────────────────────────────────

class _DebugDetailSheet extends StatelessWidget {
  const _DebugDetailSheet({required this.entry});
  final ApiDebugEntry entry;

  static String _prettyJson(dynamic value) {
    try {
      return const JsonEncoder.withIndent('  ').convert(value);
    } catch (_) {
      return value.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      expand: false,
      builder: (_, scrollController) {
        return BlocBuilder<ApiDebugCubit, ApiDebugState>(
          buildWhen: (p, c) {
            final pIdx = p.entries.indexWhere((e) => e.id == entry.id);
            final cIdx = c.entries.indexWhere((e) => e.id == entry.id);
            if (pIdx == -1 && cIdx == -1) return false;
            if (pIdx == -1 || cIdx == -1) return true;
            return p.entries[pIdx] != c.entries[cIdx];
          },
          builder: (context, state) {
            final current = state.entries.firstWhere(
              (e) => e.id == entry.id,
              orElse: () => entry,
            );
            return Container(
              decoration: const BoxDecoration(
                color: Color(0xFF1A1A2E),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 4),
                      width: 36,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 6, 16, 10),
                    child: Row(
                      children: [
                        _MethodBadge(method: current.method),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            current.shortPath,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          current.elapsedLabel,
                          style: TextStyle(
                            color: current.isCompleted ? Colors.greenAccent : Colors.amberAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: Colors.white12, height: 1),
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      padding: const EdgeInsets.all(16),
                      children: [
                        _DetailSection(
                          title: 'Full URL',
                          copyText: current.url,
                          child: Text(
                            current.url,
                            style: const TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ),
                        const SizedBox(height: 12),
                        _DetailSection(
                          title: 'Request Headers',
                          copyText: current.headers.entries
                              .map((e) => '${e.key}: ${e.value}')
                              .join('\n'),
                          child: Column(
                            crossAxisAlignment: .start,
                            children: current.headers.entries.map((e) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Row(
                                  crossAxisAlignment: .start,
                                  children: [
                                    Text(
                                      '${e.key}: ',
                                      style: const TextStyle(color: Colors.white38, fontSize: 11),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${e.value}',
                                        style: const TextStyle(color: Colors.white70, fontSize: 11),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        if (current.requestBody != null) ...[
                          const SizedBox(height: 12),
                          _DetailSection(
                            title: 'Request Body',
                            copyText: _prettyJson(current.requestBody),
                            child: Text(
                              _prettyJson(current.requestBody),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                                fontFamily: 'monospace',
                              ),
                            ),
                          ),
                        ],
                        const SizedBox(height: 12),
                        _DetailSection(
                          title: current.isError
                              ? 'Error'
                              : 'Response (${current.statusCode ?? '…'})',
                          copyText: current.isError
                              ? (current.errorMessage ?? '—')
                              : (current.responseBody ?? '—'),
                          child: current.isError
                              ? Text(
                                  current.errorMessage ?? '—',
                                  style: const TextStyle(color: Colors.redAccent, fontSize: 12),
                                )
                              : Text(
                                  current.responseBody ??
                                      (current.isCompleted ? '(empty)' : 'Waiting…'),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 11,
                                    fontFamily: 'monospace',
                                  ),
                                ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _DetailSection extends StatelessWidget {
  const _DetailSection({required this.title, required this.copyText, required this.child});
  final String title;
  final String copyText;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: copyText));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Copied to clipboard'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: const Icon(Icons.copy_rounded, color: Colors.white38, size: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}
