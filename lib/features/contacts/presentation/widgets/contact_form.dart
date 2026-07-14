import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/core/widgets/custom_form_field.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_i/features/contacts/presentation/manger/contacts_cubit.dart';
import 'package:day_i/features/contacts/presentation/manger/contacts_state.dart';
import 'package:day_i/core/utils/extensions/snack_bar_extension.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<ContactsCubit>().sendContactMessage(
            name: _nameController.text,
            email: _emailController.text,
            subject: _subjectController.text,
            message: _messageController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactsCubit, ContactsState>(
      listener: (context, state) {
        if (state is ContactsSuccess) {
          context.showSuccessSnackBar(
            message: S.of(context).messageSentSuccessfully,
          );
          _nameController.clear();
          _emailController.clear();
          _subjectController.clear();
          _messageController.clear();
        } else if (state is ContactsFailure) {
          context.showErrorSnackBar(
            message: state.error,
          );
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFormField(
              controller: _nameController,
              label: S.of(context).fullName,
              hintText: 'John Doe',
              validator: (value) => value == null || value.isEmpty ? 'Required' : null,
              suffixIcon: const Icon(
                Icons.person_outline,
                color: Color(0xFF9E9E9E),
              ),
              labelStyle: FontStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: const Color(0xFF121212),
              ),
            ),
            SizedBox(height: 16.h),
            CustomFormField(
              controller: _emailController,
              label: S.current.email,
              hintText: 'info@marketingagency.com',
              validator: (value) => value == null || value.isEmpty ? 'Required' : null,
              suffixIcon: const Icon(
                Icons.email_outlined,
                color: Color(0xFF9E9E9E),
              ),
              labelStyle: FontStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: const Color(0xFF121212),
              ),
            ),
            SizedBox(height: 16.h),
            CustomFormField(
              controller: _subjectController,
              label: S.current.subject,
              hintText: S.current.chooseSubject,
              validator: (value) => value == null || value.isEmpty ? 'Required' : null,
              suffixIcon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF9E9E9E),
              ),
              labelStyle: FontStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: const Color(0xFF121212),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              S.current.userMessage,
              style: FontStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: const Color(0xFF121212),
              ),
            ),
            SizedBox(height: 8.h),
            TextFormField(
              controller: _messageController,
              maxLines: 4,
              validator: (value) => value == null || value.isEmpty ? 'Required' : null,
              decoration: InputDecoration(
                hintText: S.current.writeMessageHere,
                hintStyle: FontStyles.bodyMedium.copyWith(
                  color: const Color(0xFF9E9E9E),
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: Color(0xFFE9E9E9)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: Color(0xFF4F46E5)),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            BlocBuilder<ContactsCubit, ContactsState>(
              builder: (context, state) {
                return AppButton(
                  text: state is ContactsLoading ? '...' : S.current.sendMessage,
                  onPressed: state is ContactsLoading ? () {} : _submitForm,
                  height: 48,
                  backgroundColor: const Color(0xFF4F46E5),
                  borderRadius: 8,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
