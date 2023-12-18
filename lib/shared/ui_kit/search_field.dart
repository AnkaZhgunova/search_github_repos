
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:search_repo/shared/export.dart';

class SearchField extends StatefulWidget {
  final String? title;
  final Color titleTextColor;
  final double? height;
  final int? maxLength;
  final int errorMaxLines;
  final FocusNode? focusNode;
  final double radius;
  final bool centerText;
  final bool? password;
  final bool enabled;
  final bool showError;
  final TextInputType? inputType;
  final int maxLines;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? textEditingController;
  final bool? isTextAlignCenter;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? filterTextInput;

  const SearchField({
    required this.onSubmitted,
    this.focusNode,
    this.enabled = true,
    this.titleTextColor = AppColors.black,
    this.radius = 30,
    this.centerText = false,
    this.isTextAlignCenter = false,
    this.maxLines = 1,
    this.errorMaxLines = 2,
    this.showError = true,
    this.height,
    this.maxLength,
    this.title,
    this.password,
    this.textEditingController,
    this.inputType,
    this.validator,
    this.filterTextInput,
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late FocusNode focusNode;
  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        focusNode.addListener(() {
          setState(() {});
        });
      },
      focusNode: focusNode,
      inputFormatters: widget.filterTextInput,
      enabled: widget.enabled,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: widget.maxLength,
      textAlign: widget.isTextAlignCenter! ? TextAlign.center : TextAlign.start,
      controller: widget.textEditingController,
      obscureText: widget.password ?? false,
      keyboardType: widget.inputType ?? TextInputType.text,
      onFieldSubmitted: widget.onSubmitted,
      cursorHeight: 20,
      cursorColor: AppColors.blue,
      maxLines: widget.maxLines,
      style: AppTextStyles.black14Medium400,
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: AppTextStyles.grey14Medium400,
        prefixIcon: Transform.scale(
          scale: 0.5,
          child: SvgPicture.asset(
            AppIcons.searchIcon,
          ),
        ),
        suffixIcon: focusNode.hasFocus
            ? GestureDetector(
                onTap: () {
                  widget.textEditingController?.clear();
                  focusNode.unfocus();
                },
                child: Transform.scale(
                  scale: 0.5,
                  child: SvgPicture.asset(
                    AppIcons.closeIcon,
                  ),
                ),
              )
            : null,
        counterText: '',
        errorStyle: widget.showError ? null : const TextStyle(height: 0),
        errorMaxLines: widget.errorMaxLines,
        fillColor: focusNode.hasFocus ? AppColors.lightBlue : AppColors.lightGrey,
        filled: true,
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(
            widget.radius,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(
            widget.radius,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(
            widget.radius,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.blue, width: 2),
          borderRadius: BorderRadius.circular(
            widget.radius,
          ),
        ),
      ),
    );
  }
}
