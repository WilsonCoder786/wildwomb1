import 'package:easy_four_diy/core/app_navigator.dart';
import 'package:easy_four_diy/core/services/app_service.dart';
import 'package:easy_four_diy/core/services/iap_service.dart';
import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/dashboard/dashboard_provider.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_view.dart';
import 'package:easy_four_diy/modules/subscription/subscription_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = context.read<AppService>().appUser;
      if (user != null) {
        context.read<DashboardProvider>().loadJobs(user.email);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final provider = context.watch<DashboardProvider>();
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.dashboardTitle,
              style: Utils.getTextStyle(
                baseSize: 22,
                isBold: true,
                color: Utils.kDarkBlue,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              l10n.dashboardWelcome,
              style: Utils.getTextStyle(
                baseSize: 12,
                isBold: false,
                color: Colors.grey[600]!,
              ),
            ),
            const SizedBox(height: 24),
            _buildStatsRow(l10n, provider),
            const SizedBox(height: 24),
            _buildQuickAccess(l10n),
            const SizedBox(height: 24),
            _buildSavingsOverview(l10n, provider),
            const SizedBox(height: 24),
            _buildCostOverview(l10n, provider),
            const SizedBox(height: 24),
            _buildRecentActivities(l10n, provider),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsRow(AppLocalizations l10n, DashboardProvider provider) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 6,
      mainAxisSpacing: 6,
      childAspectRatio: 1.8,
      children: [
        _buildStatCard(
          l10n.dashboardTotalJobs,
          provider.totalJobs.toString(),
          l10n.dashboardAllTime,
          Icons.assignment_outlined,
          Colors.red,
        ),
        _buildStatCard(
          l10n.dashboardCompletedJobs,
          provider.completedJobs.toString(),
          '${provider.completedJobsPercent.toStringAsFixed(0)}% ${l10n.dashboardCompleted}',
          Icons.check_circle_outline,
          Colors.green,
        ),
        _buildStatCard(
          l10n.dashboardTotalSavings,
          '€ ${provider.totalSavings.toStringAsFixed(2)}',
          l10n.dashboardAllJobs,
          Icons.euro,
          Colors.blue,
        ),
        _buildStatCard(
          l10n.dashboardMoneySaved,
          '€ ${provider.thisMonthSavings.toStringAsFixed(2)}',
          l10n.dashboardThisMonth,
          Icons.account_balance_wallet_outlined,
          Colors.teal,
        ),
      ],
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Utils.kLightGrey, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Utils.getTextStyle(
                        baseSize: 9,
                        isBold: false,
                        color: Colors.grey[600]!,
                      ),
                    ),
                    Text(
                      value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Utils.getTextStyle(
                        baseSize: 16,
                        isBold: true,
                        color: Utils.kDarkBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Utils.getTextStyle(
              baseSize: 10,
              isBold: false,
              color: Colors.grey[500]!,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSavingsOverview(
    AppLocalizations l10n,
    DashboardProvider provider,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Utils.kLightGrey, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.dashboardSavingsOverview,
                style: Utils.getTextStyle(
                  baseSize: 16,
                  isBold: true,
                  color: Utils.kDarkBlue,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOut,
                  );
                },
                child: Text(
                  l10n.dashboardViewAll,
                  style: Utils.getTextStyle(
                    baseSize: 12,
                    isBold: true,
                    color: Utils.kOrange,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.dashboardDoItYourself,
                        style: Utils.getTextStyle(
                          baseSize: 12,
                          isBold: true,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '€ ${provider.lastJobDiyCost.toStringAsFixed(2)}',
                        style: Utils.getTextStyle(
                          baseSize: 18,
                          isBold: true,
                          color: Utils.kDarkBlue,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10n.dashboardToolsRental,
                        style: Utils.getTextStyle(
                          baseSize: 10,
                          isBold: false,
                          color: Colors.grey[600]!,
                        ),
                      ),
                      Text(
                        '€ 0.00',
                        style: Utils.getTextStyle(
                          baseSize: 14,
                          isBold: true,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Divider(),
                      Text(
                        l10n.dashboardTotal,
                        style: Utils.getTextStyle(
                          baseSize: 10,
                          isBold: false,
                          color: Colors.grey[600]!,
                        ),
                      ),
                      Text(
                        '€ ${provider.lastJobDiyCost.toStringAsFixed(2)}',
                        style: Utils.getTextStyle(
                          baseSize: 16,
                          isBold: true,
                          color: Utils.kDarkBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.orange.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.dashboardHireProfessional,
                            style: Utils.getTextStyle(
                              baseSize: 12,
                              isBold: true,
                              color: Utils.kOrange,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '€ ${provider.lastJobProCost.toStringAsFixed(2)}',
                            style: Utils.getTextStyle(
                              baseSize: 18,
                              isBold: true,
                              color: Colors.red[400]!,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Utils.kDarkBlue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.dashboardYouSave,
                        style: Utils.getTextStyle(
                          baseSize: 12,
                          isBold: false,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        '€ ${provider.totalSavings.toStringAsFixed(2)}',
                        style: Utils.getTextStyle(
                          baseSize: 20,
                          isBold: true,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        l10n.dashboardSmartDiy,
                        style: Utils.getTextStyle(
                          baseSize: 10,
                          isBold: false,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/easy_4_diy.png',
                  height: 40,
                ), // Placeholder for money icon
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCostOverview(AppLocalizations l10n, DashboardProvider provider) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Utils.kLightGrey, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.dashboardCostOverview,
                style: Utils.getTextStyle(
                  baseSize: 16,
                  isBold: true,
                  color: Utils.kDarkBlue,
                ),
              ),
              DropdownButton<String>(
                value: l10n.dashboardThisYear,
                underline: const SizedBox(),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 18,
                  color: Utils.kDarkBlue,
                ),
                items: [l10n.dashboardThisYear, l10n.dashboardThisMonth].map((
                  String value,
                ) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: Utils.getTextStyle(
                        baseSize: 12,
                        isBold: true,
                        color: Utils.kDarkBlue,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(200, 200),
                  painter: DonutChartPainter(
                    materialCost: provider.totalMaterialCost,
                    toolsCost: provider.totalToolsCost,
                    subscriptionCost: 0,
                    otherCost: 0,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      l10n.dashboardTotalCosts,
                      style: Utils.getTextStyle(
                        baseSize: 10,
                        isBold: false,
                        color: Colors.grey[600]!,
                      ),
                    ),
                    Text(
                      '€ ${provider.totalMaterialCost.toStringAsFixed(2)}',
                      style: Utils.getTextStyle(
                        baseSize: 16,
                        isBold: true,
                        color: Utils.kDarkBlue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildChartLegend(
            l10n.dashboardMaterials,
            provider.totalMaterialCost,
            provider.totalMaterialCost,
            Colors.blue,
          ),
          _buildChartLegend(
            l10n.dashboardTools,
            provider.totalToolsCost,
            provider.totalMaterialCost,
            Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildChartLegend(
    String label,
    double value,
    double total,
    Color color,
  ) {
    final pct = total > 0 ? ((value / total) * 100).toStringAsFixed(0) : '0';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: Utils.getTextStyle(
                baseSize: 13,
                isBold: true,
                color: Colors.grey[600]!,
              ),
            ),
          ),
          Text(
            '€ ${value.toStringAsFixed(2)} ($pct%)',
            style: Utils.getTextStyle(
              baseSize: 12,
              isBold: false,
              color: Colors.grey[800]!,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivities(
    AppLocalizations l10n,
    DashboardProvider provider,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Utils.kLightGrey, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.dashboardRecentActivities,
            style: Utils.getTextStyle(
              baseSize: 16,
              isBold: true,
              color: Utils.kDarkBlue,
            ),
          ),
          const SizedBox(height: 24),
          if (provider.jobs.isEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  l10n.dashboardNoRecentJobs,
                  style: Utils.getTextStyle(
                    baseSize: 12,
                    isBold: false,
                    color: Colors.grey[600]!,
                  ),
                ),
              ),
            )
          else
            ...provider.jobs
                .take(5)
                .map(
                  (job) => _buildActivityItem(
                    Icons.assignment_outlined,
                    l10n.dashboardJobCompleted(
                      job.jobName,
                      job.calculationResult.savings.toStringAsFixed(2),
                    ),
                    '${job.date.day}-${job.date.month}-${job.date.year}',
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(IconData icon, String title, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Utils.kDarkBlue.withValues(alpha: 0.7)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: Utils.getTextStyle(
                baseSize: 12,
                isBold: false,
                color: Colors.grey[700]!,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            time,
            style: Utils.getTextStyle(
              baseSize: 10,
              isBold: false,
              color: Colors.grey[500]!,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccess(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Utils.kLightGrey, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.dashboardQuickAccess,
            style: Utils.getTextStyle(
              baseSize: 16,
              isBold: true,
              color: Utils.kDarkBlue,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildQuickAccessIcon(
                Icons.assignment_add,
                l10n.dashboardNewJob,
                Colors.orange,
                onTap: () {
                  final isPremium = context.read<IAPService>().isPremium;
                  if (isPremium) {
                    context.read<OnboardingProvider>().reset();
                    AppNavigator.toName(
                      context: context,
                      page: const OnboardingView(),
                    );
                  } else {
                    AppNavigator.toName(
                      context: context,
                      page: const SubscriptionPage(),
                    );
                  }
                  // context.read<OnboardingProvider>().reset();
                  // AppNavigator.toName(
                  //   context: context,
                  //   page: const OnbpardingView(),
                  // );
                },
              ),
              _buildQuickAccessIcon(
                Icons.euro,
                l10n.dashboardCostOverview,
                Colors.green,
                onTap: () {
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOut,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccessIcon(
    IconData icon,
    String label,
    Color color, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: Utils.getTextStyle(
              baseSize: 9,
              isBold: false,
              color: Colors.grey[700]!,
            ),
          ),
        ],
      ),
    );
  }
}

class DonutChartPainter extends CustomPainter {
  final double materialCost;
  final double toolsCost;
  final double subscriptionCost;
  final double otherCost;

  DonutChartPainter({
    this.materialCost = 0,
    this.toolsCost = 0,
    this.subscriptionCost = 0,
    this.otherCost = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const strokeWidth = 30.0;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final total = materialCost + toolsCost + subscriptionCost + otherCost;

    // Nothing to show — draw a light grey placeholder ring
    if (total <= 0) {
      paint.color = Colors.grey.shade200;
      paint.strokeCap = StrokeCap.butt;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        -1.57,
        2 * 3.14159,
        false,
        paint,
      );
      return;
    }

    final data = <Map<String, dynamic>>[
      {'value': materialCost / total, 'color': Colors.blue},
      {'value': toolsCost / total, 'color': Colors.green},
      if (subscriptionCost > 0)
        {'value': subscriptionCost / total, 'color': Colors.orange},
      if (otherCost > 0) {'value': otherCost / total, 'color': Colors.purple},
    ];

    double startAngle = -1.57; // Start from top
    for (var item in data) {
      final sweepAngle = (item['value'] as double) * 2 * 3.14159;
      paint.color = item['color'] as Color;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        startAngle,
        sweepAngle - 0.05, // Small gap
        false,
        paint,
      );
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant DonutChartPainter oldDelegate) =>
      oldDelegate.materialCost != materialCost ||
      oldDelegate.toolsCost != toolsCost ||
      oldDelegate.subscriptionCost != subscriptionCost ||
      oldDelegate.otherCost != otherCost;
}
