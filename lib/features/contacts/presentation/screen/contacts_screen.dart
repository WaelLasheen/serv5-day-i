import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/di/di.dart';
import 'package:day_i/features/contacts/data/repos/contacts_repo.dart';
import 'package:day_i/features/contacts/presentation/manger/contacts_ui_cubit.dart';
import 'package:day_i/features/contacts/presentation/manger/contacts_ui_state.dart';
import 'package:day_i/features/contacts/presentation/widgets/contact_form.dart';
import 'package:day_i/features/contacts/presentation/widgets/contact_info_card.dart';
import 'package:day_i/features/contacts/presentation/widgets/contacts_tab_bar.dart';
import 'package:day_i/features/contacts/presentation/widgets/faq_list_widget.dart';
import 'package:day_i/features/contacts/presentation/widgets/map_placeholder.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:day_i/features/contacts/presentation/manger/contacts_cubit.dart';

class ContactsScreen extends StatelessWidget {
  final int initialTabIndex;
  const ContactsScreen({super.key, this.initialTabIndex = 0});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ContactsUiCubit(getIt<ContactsRepo>())..changeTab(initialTabIndex)),
        BlocProvider(create: (context) => ContactsCubit(getIt<ContactsRepo>())),
      ],
      child: const _ContactsView(),
    );
  }
}

class _ContactsView extends StatefulWidget {
  const _ContactsView();

  @override
  State<_ContactsView> createState() => _ContactsViewState();
}

class _ContactsViewState extends State<_ContactsView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      context.read<ContactsUiCubit>().loadMoreFaqs();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appTheme.surfaceColor,
      appBar: AppBar(
        backgroundColor: appTheme.surfaceColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.current.contactInfo,
          style: FontStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: appTheme.textPrimary,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: appTheme.primaryColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<ContactsUiCubit>().loadFaqs();
        },
        child: BlocBuilder<ContactsUiCubit, ContactsUiState>(
          buildWhen: (previous, current) => 
              previous.tabIndex != current.tabIndex ||
              previous.isContactInfoLoading != current.isContactInfoLoading ||
              previous.contactInfo != current.contactInfo,
          builder: (context, state) {
            return CustomScrollView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 16.h),
                        const ContactsTabBar(),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
                if (state.tabIndex == 0)
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const ContactForm(),
                          SizedBox(height: 32.h),
                          ContactInfoCard(
                            contactInfo: state.contactInfo,
                            isLoading: state.isContactInfoLoading,
                          ),
                          SizedBox(height: 16.h),
                          const MapPlaceholder(),
                        ],
                      ),
                    ),
                  )
                else
                  const FaqListWidget(),
                SliverToBoxAdapter(child: SizedBox(height: 120.h)),
              ],
            );
          },
        ),
      ),
    );
  }
}
