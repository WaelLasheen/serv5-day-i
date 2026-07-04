import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/features/contacts/presentation/manger/contacts_ui_cubit.dart';
import 'package:day_i/features/contacts/presentation/manger/contacts_ui_state.dart';
import 'faq_item_widget.dart';

class FaqListWidget extends StatelessWidget {
  const FaqListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsUiCubit, ContactsUiState>(
      builder: (context, state) {
        if (state.faqs.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.faqs.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final faq = state.faqs[index];
            final isExpanded = state.expandedFaqIndex == index;

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
    );
  }
}
