import 'package:flutter/material.dart';
import 'package:loja_roupas/models/page_manager.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget {

  final IconData _iconData;
  final String _title;
  final int _page;

  DrawerTile(this._iconData, this._title, this._page);

  @override
  Widget build(BuildContext context) {
    final int curPage = context.watch<PageManager>().page;
    final Color primaryColor = Theme.of(context).primaryColor;

    //InkWell faz uma animação (de toq) ao clicar
    return InkWell(
      onTap: (){
        context.read<PageManager>().setPage(_page);
        debugPrint('Toquei $_page');
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: Icon(
                _iconData,
                size: 32,
                color: curPage == _page ? primaryColor : Colors.grey[700],
              ),
            ),
            Text(
              _title,
              style: TextStyle(
                  fontSize: 16,
                  color: curPage == _page ? primaryColor : Colors.grey[700],
              ),
            )
          ],
        ),
      ),
    );
  }
}
