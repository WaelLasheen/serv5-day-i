import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/features/contacts/presentation/manger/contacts_ui_cubit.dart';
import 'package:day_i/features/contacts/presentation/manger/contacts_ui_state.dart';
import 'package:day_i/generated/l10n.dart';
import 'faq_item_widget.dart';

class FaqListWidget extends StatelessWidget {
  const FaqListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsUiCubit, ContactsUiState>(
      buildWhen: (previous, current) =>
          previous.faqs != current.faqs ||
          previous.isLoading != current.isLoading ||
          previous.isFetchingMore != current.isFetchingMore,
      builder: (context, state) {
        if (state.isLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state.faqs.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                S.current.noFaqsAvailable,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }

        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          sliver: SliverList.separated(
            itemCount: state.faqs.length + (state.isFetchingMore ? 1 : 0),
            separatorBuilder: (context, index) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              if (index >= state.faqs.length) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: const Center(child: CircularProgressIndicator()),
                );
              }
              final faq = state.faqs[index];

              return BlocSelector<ContactsUiCubit, ContactsUiState, bool>(
                selector: (state) => state.expandedFaqIndex == index,
                builder: (context, isExpanded) {
                  return FaqItemWidget(
                    index: index,
                    question: faq.question,
                    answer: faq.answer,
                    isExpanded: isExpanded,
                    onTap: () {
                      context.read<ContactsUiCubit>().toggleFaq(index);
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
