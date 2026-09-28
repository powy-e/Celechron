import 'package:celechron/l10n/l10n.dart';
import 'package:celechron/design/persistent_headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CustomLicensePage extends StatelessWidget {
  const CustomLicensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            CelechronSliverTextHeader(
                subtitle: context.l10n.coreTermsOfService),
            SliverPadding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(
                    height: 36,
                  ),
                  Text(
                    context.l10n.coreDisclaimer,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    context.l10n.coreWarrantyDisclaimer,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    context.l10n.coreLiabilityLimitation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    context.l10n.coreLiabilityText,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CupertinoButton(
                    child: Text(context.l10n.coreViewFullGpl),
                    onPressed: () async {
                      await launchUrlString(
                        'https://www.gnu.org/licenses/gpl-3.0.html',
                        mode: LaunchMode.externalApplication,
                      );
                    },
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
