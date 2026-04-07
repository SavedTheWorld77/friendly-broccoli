import 'package:dev_portfolio/theme/app_typography.dart';
import 'package:dev_portfolio/widgets/app_text_scale.dart';
import 'package:dev_portfolio/widgets/experience_card.dart';
import 'package:dev_portfolio/widgets/featured_project_hover_card.dart';
import 'package:dev_portfolio/widgets/nav_text.dart';
import 'package:dev_portfolio/widgets/phone_widget.dart';
import 'package:dev_portfolio/widgets/project_hover_card.dart';
import 'package:dev_portfolio/widgets/responsive_layout_widget.dart';
import 'package:dev_portfolio/widgets/section_layout.dart';
import 'package:dev_portfolio/widgets/skill_hover_card.dart';
import 'package:dev_portfolio/widgets/tablet_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:web/web.dart' as web;

class LandingPage extends StatefulWidget {
  const LandingPage({super.key, required this.onToggle});
  final Function() onToggle;
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey aboutMeKey = GlobalKey();
  final GlobalKey stacksKey = GlobalKey();
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final listTileColor = Theme.of(context).listTileTheme;
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Text(
            "// rhen.dev",
            style: AppTextScale.of(context).scale(
              textTheme.bodyLarge!.copyWith(
                color: color.primary,
                fontFamily: AppTypography.spaceMono,
              ),
            ),
          ),
        ),
        leadingWidth: 160.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: _buildDivider(),
        ),
        toolbarHeight: 90.0,
        centerTitle: true,
        title: Row(
          spacing: 24.0,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavText(label: 'work', onTap: () {}),
            NavText(label: 'stack', onTap: () => _navigateToKey(stacksKey)),
            NavText(label: 'about', onTap: () => _navigateToKey(aboutMeKey)),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              widget.onToggle();
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
          Gap(12.0),
          _hireMeButton(color, textTheme),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 90 + 64.0, bottom: 12.0),
          child: Column(
            spacing: 64.0,
            children: [
              ResponsiveLayoutWidget(
                phone: _firstSectionPhone(color, textTheme, listTileColor),
                desktop: _firstSectionWeb(color, textTheme, listTileColor),
              ),
              _buildDivider(),
              _buildSecondSection(),
              _buildDivider(),
              _buildThirdSection(),
              _buildDivider(),
              _buildFourthSection(),
              _buildDivider(),
              _buildFifthSection(),
              _buildGetInTouch(),
              Gap(24.0),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildGetInTouch() {
    final color = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      alignment: Alignment.center,
      width: double.infinity,
      color: color.surface,
      child: Column(
        spacing: 24.0,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildGetInTouchText(),
          _buildLetsWorkTogetherText(),
          Gap(12.0),
          _buildGetInTouchDescText(),
          Gap(12.0),
          _buildGetInTouchButtons(),
        ],
      ),
    );
  }

  Container _buildFooter() {
    final color = Theme.of(context).colorScheme;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '// rhen.dev — flutter developer, ph',
            style: AppTextScale.of(context).scale(
              AppTypography.monoMeta.copyWith(color: color.onSurfaceVariant),
            ),
          ),
          Text(
            '2026',
            style: AppTextScale.of(context).scale(
              AppTypography.monoMeta.copyWith(color: color.onSurfaceVariant),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Text _buildGetInTouchText() {
    final color = Theme.of(context).colorScheme;
    return Text(
      'get in touch',
      style: AppTypography.monoEyebrow.copyWith(
        color: color.onSurfaceVariant,
        fontSize: 15.0,
      ),
    );
  }

  Text _buildLetsWorkTogetherText() {
    return Text(
      '''Let's work together''',
      style: Theme.of(context).textTheme.displayLarge,
    );
  }

  SizedBox _buildGetInTouchDescText() {
    final textTheme = Theme.of(context).textTheme;
    final listTileColor = Theme.of(context).listTileTheme;

    return SizedBox(
      width: 600.0,
      child: Text(
        '''Open to freelance projects, contract work, and full-time roles. If you're building something with Flutter — especially anything complex — I'd love to hear about it.''',
        style: AppTextScale.of(context).scale(
          textTheme.bodyLarge!.copyWith(
            color: listTileColor.iconColor,
            fontSize: 16.0,
          ),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Row _buildGetInTouchButtons() {
    return Row(
      spacing: 24.0,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSendMeAnEmailButton(),
        _buildGithubButton(),
        _buildLinkedInButton(),
      ],
    );
  }

  SizedBox _buildSendMeAnEmailButton() {
    return SizedBox(
      height: 50,
      child: ElevatedButton(onPressed: () {}, child: Text('send me an email')),
    );
  }

  SizedBox _buildGithubButton() {
    return SizedBox(
      height: 50,
      child: OutlinedButton(onPressed: () {}, child: Text('GitHub')),
    );
  }

  SizedBox _buildLinkedInButton() {
    return SizedBox(
      height: 50,
      child: OutlinedButton(onPressed: () {}, child: Text('LinkedIn')),
    );
  }

  Row _buildAboutMeOverline() {
    final textTheme = Theme.of(context).textTheme;
    final listTileColor = Theme.of(context).listTileTheme;
    return Row(
      spacing: 12.0,
      children: [
        Container(
          height: 1.0,
          width: 32.0,
          decoration: BoxDecoration(color: listTileColor.iconColor),
        ),
        Text(
          'about me',
          style: AppTextScale.of(context).scale(
            textTheme.labelSmall!.copyWith(
              color: listTileColor.iconColor,
              letterSpacing: 3.0,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    );
  }

  Row _buildAvailableForNewProjectsText() {
    final textTheme = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return Row(
      spacing: 12.0,
      children: [
        // Container(
        //   height: 1.0,
        //   width: 32.0,
        //   decoration: BoxDecoration(color: listTileColor.iconColor),
        // ),
        Text(
          'available for new projects',
          style: AppTextScale.of(context).scale(
            textTheme.labelSmall!.copyWith(
              color: color.secondary,
              fontSize: 12.0,
              letterSpacing: 0,
            ),
          ),
        ),
      ],
    );
  }

  Column _buildAboutMeSectionName() {
    return Column(
      spacing: 12.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAboutMeOverline(),
        _buildHeadline('the person behind the code'),
      ],
    );
  }

  Padding _buildFifthSection() {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final listTileColor = Theme.of(context).listTileTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SectionLayout(
        key: aboutMeKey,
        child: ResponsiveLayoutWidget(
          phone: _buildAboutMeSectionPhone(color, textTheme, listTileColor),
          tablet: _buildAboutMeSectionPhone(color, textTheme, listTileColor),
          desktop: _buildAboutMeSectionWeb(color, textTheme, listTileColor),
        ),
      ),
    );
  }

  Row _buildAboutMeSectionWeb(
    ColorScheme color,
    TextTheme textTheme,
    ListTileThemeData listTileColor,
  ) {
    return Row(
      spacing: 128.0,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAboutMeSectionName(),
              Gap(48.0),
              Container(
                height: 180.0,
                width: 180.0,
                decoration: BoxDecoration(
                  color: color.surfaceContainer,
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.0, color: color.outline),
                  image: DecorationImage(image: AssetImage('assets/rhen.jpg')),
                ),
              ),
              Gap(24.0),
              _buildAvailableForNewProjectsText(),
              Gap(24.0),
              RichText(
                text: TextSpan(
                  style: AppTextScale.of(context).scale(
                    textTheme.bodyMedium!.copyWith(
                      color: listTileColor.iconColor,
                    ),
                  ),
                  children: [
                    TextSpan(text: '''I'm a Flutter developer based in the '''),
                    TextSpan(
                      text: '''Philippines ''',
                      style: AppTextScale.of(context).scale(
                        textTheme.bodyMedium!.copyWith(color: Colors.white),
                      ),
                    ),
                    TextSpan(
                      text:
                          '''with 5+ years of experience building cross-platform mobile and web apps. I've shipped products used by real users — from investment features inside the Maya super app to hotel management systems contracted by Marriott Hotels US.\n\n''',
                    ),
                    TextSpan(text: '''I care deeply about '''),
                    TextSpan(
                      text: '''clean architecture''',
                      style: AppTextScale.of(context).scale(
                        textTheme.bodyMedium!.copyWith(color: Colors.white),
                      ),
                    ),
                    TextSpan(
                      text:
                          ''', offline-first design, and building things that actually hold up in production. I prefer working close to the problem — understanding what the product needs before writing a single line of code.\n\n''',
                    ),
                    TextSpan(text: '''Outside work, I ride my '''),
                    TextSpan(
                      text: '''XSR155 ''',
                      style: AppTextScale.of(context).scale(
                        textTheme.bodyMedium!.copyWith(color: Colors.white),
                      ),
                    ),
                    TextSpan(
                      text:
                          '''around town, keep up with anime and manga, and hunt for good streetwear finds in thrift stores. I also taught mobile development to college students for a year — turns out explaining things to others makes you a better developer.''',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(child: _buildAboutMeCards()),
      ],
    );
  }

  Column _buildAboutMeSectionPhone(
    ColorScheme color,
    TextTheme textTheme,
    ListTileThemeData listTileColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAboutMeSectionName(),
        Gap(48.0),
        Container(
          height: 180.0,
          width: 180.0,
          decoration: BoxDecoration(
            color: color.surfaceContainer,
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: color.outline),
            image: DecorationImage(image: AssetImage('assets/rhen.jpg')),
          ),
        ),
        Gap(24.0),
        _buildAvailableForNewProjectsText(),
        Gap(24.0),
        RichText(
          text: TextSpan(
            style: AppTextScale.of(context).scale(
              textTheme.bodyMedium!.copyWith(color: listTileColor.iconColor),
            ),
            children: [
              TextSpan(text: '''I'm a Flutter developer based in the '''),
              TextSpan(
                text: '''Philippines ''',
                style: AppTextScale.of(
                  context,
                ).scale(textTheme.bodyMedium!.copyWith(color: Colors.white)),
              ),
              TextSpan(
                text:
                    '''with 5+ years of experience building cross-platform mobile and web apps. I've shipped products used by real users — from investment features inside the Maya super app to hotel management systems contracted by Marriott Hotels US.\n\n''',
              ),
              TextSpan(text: '''I care deeply about '''),
              TextSpan(
                text: '''clean architecture''',
                style: AppTextScale.of(
                  context,
                ).scale(textTheme.bodyMedium!.copyWith(color: Colors.white)),
              ),
              TextSpan(
                text:
                    ''', offline-first design, and building things that actually hold up in production. I prefer working close to the problem — understanding what the product needs before writing a single line of code.\n\n''',
              ),
              TextSpan(text: '''Outside work, I ride my '''),
              TextSpan(
                text: '''XSR155 ''',
                style: AppTextScale.of(
                  context,
                ).scale(textTheme.bodyMedium!.copyWith(color: Colors.white)),
              ),
              TextSpan(
                text:
                    '''around town, keep up with anime and manga, and hunt for good streetwear finds in thrift stores. I also taught mobile development to college students for a year — turns out explaining things to others makes you a better developer.''',
              ),
            ],
          ),
        ),
        _buildAboutMeCards(),
      ],
    );
  }

  Column _buildAboutMeCards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAboutMeCard('📍', 'location', 'Philippines'),
        _buildAboutMeCard('💼', 'experience', '5+ years Flutter development'),
        _buildAboutMeCard(
          '🎯',
          'specialization',
          'Cross-platform · Firebase · BLoC',
        ),
        _buildAboutMeCard('🏍️', 'rides', 'Yamaha XSR155'),
        _buildAboutMeCard(
          '📚',
          'currently watching',
          'Fire Force · Tensura · One Piece',
        ),
        _buildAboutMeCard('🎓', 'also', 'Former college instructor · PDM'),
      ],
    );
  }

  Container _buildAboutMeCard(
    String iconString,
    String label,
    String description,
  ) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final listTileColor = Theme.of(context).listTileTheme;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        color: color.surface,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: color.outline, width: 1.5),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        spacing: 24.0,
        children: [
          Text(iconString, style: TextStyle(fontSize: 21)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextScale.of(context).scale(
                  textTheme.labelSmall!.copyWith(
                    color: listTileColor.iconColor,
                    letterSpacing: 0,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Gap(4.0),
              Text(
                description,
                style: AppTextScale.of(
                  context,
                ).scale(textTheme.bodyLarge!.copyWith(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding _buildFourthSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SectionLayout(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionName(overline: 'background', headline: 'experience'),
            Gap(128.0),
            ExperienceCard(
              timeline: '2023 - present',
              title: 'Lead Flutter Developer',
              subtitle: 'PaxAide (Independent)',
              description:
                  '''Architecting and building a full-stack hotel and airline management platform contracted by executives at Marriott Hotels US. Responsible for Flutter Web and Android apps, Firebase backend, CI/CD pipeline via Codemagic, and dual DEV/PROD environment management.''',
              tags: [
                'Flutter',
                'Firebase',
                'BloC',
                'Codemagic',
                'GoRouter',
                'Cloud Functions',
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 32.0),
              child: _buildDivider(),
            ),
            ExperienceCard(
              timeline: '2024 - present',
              title: 'Senior Flutter Developer',
              subtitle: 'MobileMo',
              description:
                  '''Assigned to build a fully customized multi-tenant SaaS platform for client-specific form creation and reporting workflows. Integrated AI capabilities for automated report generation and data analysis, removing the need for developer intervention per client configuration.''',
              tags: ['Flutter', 'AI', 'SaaS', 'Multi-tenant', 'Reporting'],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 32.0),
              child: _buildDivider(),
            ),
            ExperienceCard(
              timeline: 'ongoing',
              title: 'Mobile App Developer',
              subtitle: 'Freelance / Contract',
              description:
                  'Delivering cross-platform Flutter applications for various clients. Specializing in clean architecture patterns, offline-first data sync, and complex multi-step UI flows.',
              tags: [
                'Flutter',
                'React',
                'Dart',
                'Web',
                'Mobile Development',
                'SQLite',
                'REST APIs',
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 32.0),
              child: _buildDivider(),
            ),
            ExperienceCard(
              timeline: '2023 - 2024',
              title: 'College Instructor',
              subtitle: 'Pambayang Dalubhasaan ng Marilao',
              description:
                  'Taught mobile development to two sections of 3rd year IT students, covering Flutter fundamentals and practical app development workflows.',
              tags: ['Flutter', 'Mobile Development', 'Teaching'],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 32.0),
              child: _buildDivider(),
            ),
            ExperienceCard(
              timeline: '2022 - 2024',
              title: 'Software Engineer',
              subtitle: 'Guerilla360',
              description:
                  '''Built and shipped two client-facing Flutter applications — Maya Funds, an investment feature now fully integrated and live in the Maya super app since 2023, and HMR Shop n' Bid, a live e-commerce platform with real-time livestream auction capabilities.''',
              tags: [
                'Flutter',
                'Firebase',
                'Fintech',
                'Livestream',
                'E-commerce',
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 32.0),
              child: _buildDivider(),
            ),
            ExperienceCard(
              timeline: '2020 - 2022',
              title: 'Lead Software Engineer',
              subtitle: 'Hooli Development Services',
              description:
                  '''Led development of ReadyAgent, an Uber-style real estate agent hailing app with live Google Maps tracking and dual customer/agent portals. Also built the Website Email Marketing tool — a Python/Django automation pipeline that audits client websites via Lighthouse and sends personalized optimization reports.''',
              tags: [
                'Flutter',
                'Google Maps',
                'Golang',
                'MySQL',
                'Python',
                'Django',
              ],
            ),
          ],
        ),
      ),
    );
  }

  SectionLayout _buildThirdSection() {
    return SectionLayout(
      key: projectsKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionName(overline: 'selected work', headline: 'projects'),
            Gap(64.0),
            FeaturedProjectHoverCard(),
            Gap(24.0),
            ..._buildProjectHoverCards([
              ProjectHoverCard(
                title: 'Finance Tracker',
                description:
                    'Personal finance app with Firestore/SQLite hybrid sync, warm "Parchment" design system, and BLoC state management. Built for offline-first reliability.',
                projectTag: ProjectTag.offlineFirst,
                tags: ['Flutter', 'Drift', 'Firestore'],
              ),
              ProjectHoverCard(
                title: 'ReadyAgent',
                description:
                    '''Uber-style real estate agent hailing app. Customers browse properties on a live Google Maps interface, tap a listing to see available agents, and request a meeting on the spot. Agents receive requests in real time and both parties can track each other's location live — like ride-hailing, but for property viewings. Sole developer.''',
                projectTag: ProjectTag.dualPortal,
                tags: [
                  'Flutter',
                  'Google Maps',
                  'Real-time',
                  'Live Tracking',
                  'MySQL',
                  'Firebase',
                  'Golang',
                ],
                onViewTap: () =>
                    web.window.open('https://www.readyagent.app', '_blank'),
              ),
              ProjectHoverCard(
                onViewTap: () =>
                    web.window.open('https://www.maya.ph/funds', '_blank'),
                title: 'Maya Funds',
                description:
                    'Investment feature contracted by Maya and fully integrated into the main Maya super app. Users can invest in ATRAM funds and other instruments, with a built-in risk appetite calculator to guide investment decisions. Live on the Maya app since 2023. Sole developer.',
                projectTag: ProjectTag.liveFintech,
                tags: ['Flutter', 'Firebase', 'Fintech', 'ATRAM', 'Maya'],
              ),
              ProjectHoverCard(
                onViewTap: () => web.window.open(
                  'https://play.google.com/store/apps/details?id=ph.hmr.shopnbid',
                  '_blank',
                ),
                title: '''HMR Shop n' Bid''',
                description:
                    '''E-commerce platform for HMR with a twist — beyond standard product listings, it features a live bidding system with real-time livestream auctions. Think Shopee, but with a built-in live shopping and bidding experience for HMR's inventory.''',
                projectTag: ProjectTag.eCommerce,
                tags: [
                  'Flutter',
                  'Livestream',
                  'Real-time',
                  'E-commerce',
                  'Firebase',
                ],
              ),
              ProjectHoverCard(
                title: 'SaaS Form & Report Builder',
                description:
                    'Fully customized multi-tenant SaaS platform where client-specific forms and reporting workflows are built directly in-app. Integrated with AI for generating custom reports and analyzing submission data — no dev intervention needed per client configuration.',
                projectTag: ProjectTag.saasAiPowered,
                tags: ['Flutter', 'AI', 'Multi-tenant', 'SaaS', 'Reporting'],
              ),
              ProjectHoverCard(
                title: 'Marketing Mailer',
                description:
                    'Python and Django tool that automates web performance auditing and outreach. Reads a list of client websites from an Excel file, runs Lighthouse checks on each one, then sends a personalized email to each site owner with their Lighthouse score and tailored optimization tips — used to market our web development optimization services.',
                projectTag: ProjectTag.utility,
                tags: ['Python', 'Django', 'Lighthouse', 'Automation', 'Email'],
              ),
              ProjectHoverCard(
                title: 'Open to collaboration',
                description:
                    '''Looking for interesting Flutter projects — especially apps with complex state, real-time data, or offline-first requirements. Let's build something.''',
                projectTag: ProjectTag.available,
                tags: ['Freelance', 'Contract'],
              ),
            ]),
          ],
        ),
      ),
    );
  }

  List<Container> _buildProjectHoverCards(List<Widget> cards) {
    final List<Container> rows = [];

    for (int i = 0; i < cards.length; i += 2) {
      final first = cards[i];
      final second = ((i + 1) < cards.length) ? cards[i + 1] : null;
      rows.add(
        .new(
          margin: EdgeInsets.only(bottom: 12.0),
          child: Row(
            spacing: 12.0,
            children: [
              Expanded(child: first),
              Expanded(child: second ?? Container()),
            ],
          ),
        ),
      );
    }
    return rows;
  }

  Padding _buildSecondSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SectionLayout(
        key: stacksKey,
        child: Column(
          spacing: 64.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionName(
              overline: 'tech stack',
              headline: 'tools of the trade',
            ),
            Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              children: [
                SizedBox(
                  width: 180,
                  height: 140,
                  child: SkillHoverCard(
                    iconString: '🐦',
                    title: 'Flutter',
                    description: 'primary framework',
                  ),
                ),
                SizedBox(
                  width: 180,
                  height: 140,
                  child: SkillHoverCard(
                    iconString: '🎯',
                    title: 'Dart',
                    description: 'language',
                  ),
                ),
                SizedBox(
                  width: 180,
                  height: 140,
                  child: SkillHoverCard(
                    iconString: '🔥',
                    title: 'Firebase',
                    description: 'Firestore · Auth · Storage',
                  ),
                ),
                SizedBox(
                  width: 180,
                  height: 140,
                  child: SkillHoverCard(
                    iconString: '🧱',
                    title: 'BLoC / Cubit',
                    description: 'state management',
                  ),
                ),
                SizedBox(
                  width: 180,
                  height: 140,
                  child: SkillHoverCard(
                    iconString: '🗄️',
                    title: 'Drift ORM',
                    description: 'local SQLite',
                  ),
                ),
                SizedBox(
                  width: 180,
                  height: 140,
                  child: SkillHoverCard(
                    iconString: '🔀',
                    title: 'GoRouter',
                    description: 'navigation',
                  ),
                ),
                SizedBox(
                  width: 180,
                  height: 140,
                  child: SkillHoverCard(
                    iconString: '🚀',
                    title: 'Codemagic',
                    description: 'CI/CD',
                  ),
                ),
                SizedBox(
                  width: 180,
                  height: 140,
                  child: SkillHoverCard(
                    iconString: '☁️',
                    title: 'Cloud Functions',
                    description: 'backend logic',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text _buildOverline(String text) {
    final textTheme = Theme.of(context).textTheme;
    final listTileColor = Theme.of(context).listTileTheme;
    return Text(
      text,
      style: AppTextScale.of(context).scale(
        textTheme.labelSmall!.copyWith(
          color: listTileColor.iconColor,
          letterSpacing: 3.0,
          fontSize: 14.0,
        ),
      ),
    );
  }

  Text _buildHeadline(String text) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      text,
      style: AppTextScale.of(
        context,
      ).scale(textTheme.displayMedium!.copyWith(color: Colors.white)),
    );
  }

  Column _buildSectionName({
    required String overline,
    required String headline,
  }) {
    return Column(
      spacing: 12.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildOverline(overline), _buildHeadline(headline)],
    );
  }

  Container _buildDivider() {
    final color = Theme.of(context).colorScheme;
    return Container(height: 1, color: color.outline);
  }

  SectionLayout _firstSectionWeb(
    ColorScheme color,
    TextTheme textTheme,
    ListTileThemeData listTileColor,
  ) {
    return SectionLayout(
      child: Row(
        children: [
          Expanded(child: _buildIntro(color, textTheme, listTileColor)),
          _buildPhone(),
        ],
      ),
    );
  }

  SectionLayout _firstSectionPhone(
    ColorScheme color,
    TextTheme textTheme,
    ListTileThemeData listTileColor,
  ) {
    return SectionLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 24.0,
        children: [
          _buildIntroPhone(color, textTheme, listTileColor),
          _buildPhone(),
        ],
      ),
    );
  }

  Stack _buildPhone() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        PhoneWidget(),
        Positioned(right: 0, bottom: -20, child: TabletWidget()),
      ],
    );
  }

  Column _buildIntro(
    ColorScheme color,
    TextTheme textTheme,
    ListTileThemeData listTileColor,
  ) {
    return Column(
      spacing: 24.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _roleTitle(color, textTheme),
        _headline(textTheme, color),
        Text(
          'I craft cross-platform mobile and web experiences with\nFlutter and Firebase — clean architecture, smooth\nanimations, real-world performance.',
          style: AppTextScale.of(context).scale(
            textTheme.bodyLarge!.copyWith(color: listTileColor.iconColor),
          ),
        ),
        _actionButtons(color, textTheme),
      ],
    );
  }

  Row _actionButtons(ColorScheme color, TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildViewProjectsButton(color, textTheme),
        _buildDownloadCVButton(color, textTheme),
      ],
    );
  }

  Padding _buildIntroPhone(
    ColorScheme color,
    TextTheme textTheme,
    ListTileThemeData listTileColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        spacing: 24.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _roleTitle(color, textTheme),
          _headline(textTheme, color),
          Text(
            'I craft cross-platform mobile and web experiences with\nFlutter and Firebase — clean architecture, smooth\nanimations, real-world performance.',
            style: AppTextScale.of(context).scale(
              textTheme.bodyLarge!.copyWith(color: listTileColor.iconColor),
            ),
          ),
          _actionButtons(color, textTheme),
        ],
      ),
    );
  }

  RichText _headline(TextTheme textTheme, ColorScheme color) {
    return RichText(
      text: TextSpan(
        text: 'Building apps\nthat feel',
        style: AppTextScale.of(
          context,
        ).scale(textTheme.displayLarge!.copyWith(color: Colors.white)),
        children: [
          TextSpan(
            text: ' native',
            style: AppTextScale.of(
              context,
            ).scale(textTheme.displayLarge!.copyWith(color: color.primary)),
          ),
        ],
      ),
    );
  }

  Row _roleTitle(ColorScheme color, TextTheme textTheme) {
    return Row(
      spacing: 12.0,
      children: [
        Container(
          height: 1.0,
          width: 32.0,
          decoration: BoxDecoration(color: color.secondary),
        ),
        Text(
          'flutter developer',
          style: AppTextScale.of(context).scale(
            textTheme.bodyMedium!.copyWith(
              color: color.secondary,
              letterSpacing: 3.0,
            ),
          ),
        ),
      ],
    );
  }

  Container _hireMeButton(ColorScheme color, TextTheme textTheme) {
    return Container(
      margin: EdgeInsets.only(right: 24.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.hovered)) {
              // Optional hover color
              return color.primary.withValues(alpha: 0.3);
            }
            return Colors.transparent;
          }),

          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
              side: BorderSide(color: color.primary, width: 1.5),
            ),
          ),
        ),
        child: Text(
          'hire me',
          style: AppTextScale.of(
            context,
          ).scale(textTheme.labelLarge!.copyWith(color: color.primary)),
        ),
      ),
    );
  }

  void _navigateToKey(GlobalKey sectionKey) {
    final context = sectionKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  Container _buildViewProjectsButton(ColorScheme color, TextTheme textTheme) {
    return Container(
      margin: EdgeInsets.only(right: 24.0),
      child: ElevatedButton(
        onPressed: () => _navigateToKey(projectsKey),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            // if (states.contains(WidgetState.hovered)) {
            //   // Optional hover color
            //   return color.primary.withValues(alpha: 0.3);
            // }
            return color.primary;
          }),

          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          ),
        ),
        child: Text(
          'view projects',
          style: AppTextScale.of(context).scale(
            textTheme.labelLarge!.copyWith(
              color: Colors.black,
              fontFamily: AppTypography.spaceMono,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Container _buildDownloadCVButton(ColorScheme color, TextTheme textTheme) {
    final listTileColor = Theme.of(context).listTileTheme;
    return Container(
      margin: EdgeInsets.only(right: 24.0),
      child: ElevatedButton(
        onPressed: downloadCv,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.hovered)) {
              // Optional hover color
              return color.primary.withValues(alpha: 0.3);
            }
            return Colors.transparent;
          }),

          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
              side: BorderSide(
                color: listTileColor.iconColor ?? Colors.white,
                width: 1.5,
              ),
            ),
          ),
        ),
        child: Text(
          'download cv',
          style: AppTextScale.of(context).scale(
            textTheme.labelLarge!.copyWith(
              color: Colors.white,
              fontFamily: AppTypography.spaceMono,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  void downloadCv() {
    web.document.createElement('a') as web.HTMLAnchorElement
      ..href = 'assets/rhen_cv_2026.pdf'
      ..download = 'rhen_cv.pdf'
      ..click();
  }

  EdgeInsets responsivePadding() {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) {
      // phone
      return const EdgeInsets.symmetric(horizontal: 32);
    } else if (width < 1024) {
      // tablet
      return const EdgeInsets.symmetric(horizontal: 64);
    } else {
      // desktop
      return const EdgeInsets.symmetric(horizontal: 128);
    }
  }
}
