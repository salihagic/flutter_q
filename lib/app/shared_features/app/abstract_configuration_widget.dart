import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

class AbstractConfigurationWidget extends StatelessWidget {
  const AbstractConfigurationWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AbstractConfiguration(
      paginationConfiguration: PaginationConfiguration(
        page: 1,
        pageSize: 20,
        toJson: (page, pageSize) => {
          'page': page,
        },
      ),
      translations: AbstractTranslations(
        reload: context.translations.reload,
        thereWasAnErrorPleaseTryAgain: context.translations.there_was_an_error_please_try_again,
        showingCachedData: context.translations.showing_cached_data,
        okay: context.translations.okay,
        cancel: context.translations.cancel,
        thereIsNoData: context.translations.there_is_no_data,
        anErrorOccuredPleaseTryAgain: context.translations.an_error_occured_please_try_again,
      ),
      cachedDataWarningDialogBuilder: (context, onReload) => InfoDialog(
        onApply: () {
          onReload?.call(context);
          context.navigator.pop();
        },
        backgroundColor: context.theme.primaryColor,
        actionLineColor: context.theme.primaryColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.translations.showing_cached_data,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 15),
            Text(
              context.translations.there_was_an_error_please_try_again,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      abstractListErrorBuilder: (context, onInit) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(context.translations.an_error_occured_please_try_again),
            const SizedBox(height: 15),
            Button(
              onTap: () => onInit.call(),
              shrinkWrap: true,
              borderColor: const Color(0xFFEC9B3E),
              child: Text(context.translations.reload),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
      child: child,
    );
  }
}
