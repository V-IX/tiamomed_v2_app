import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart' as provider;

import '../data/client_search/client_search_repository.dart';
import '../di/client_search_provider.dart';
import '../state/client_search/client_search_bloc.dart';

class ClientHomeSearchTextField extends StatefulWidget {
  const ClientHomeSearchTextField({super.key});

  @override
  State<ClientHomeSearchTextField> createState() => _ClientHomeSearchTextFieldState();
}

class _ClientHomeSearchTextFieldState extends State<ClientHomeSearchTextField> {
  final SearchController _searchController = SearchController();

  final String _zeroWidthSpace = '\u200B';

  void rebuildSuggestions() {
    // save previous text
    final String previousText = _searchController.text;

    _searchController.text = '$_zeroWidthSpace$previousText'; // This will trigger updateSuggestions and call `suggestionsBuilder`.

    // restore previous text
    _searchController.text = previousText;
  }

  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
      providers: <SingleChildWidget>[
        clientSearchApiServiceProvider,
        clientSearchRepositoryProvider
      ],
      child: bloc.BlocProvider<ClientSearchBloc>(
        create: (BuildContext context) =>
        ClientSearchBloc(
            clientSearchRepository: context.read<ClientSearchRepository>()
        )..add(GetClientSearchItemEvent(text: '')),
        child: bloc.BlocConsumer<ClientSearchBloc, ClientSearchState>(
          listener: (BuildContext context, ClientSearchState state) {
            setState(() {
              rebuildSuggestions();
            });
          },
          builder: (BuildContext context, ClientSearchState state) {


            return Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).viewPadding.top),
              child: SearchAnchor(
                  searchController: _searchController,
                  viewOnSubmitted: (String text) {
                    setState(() {
                      //context.push(AppRouter.searchPage.routePath, extra: text);
                      _searchController.closeView('');
                    });
                  },
                  viewOnChanged: (String text) {
                    //context.read<SearchFieldBloc>().add(GetSearchItemEvent(text: text));

                  },
                  builder: (BuildContext context, SearchController controller) {
                    return SearchBar(
                      hintText: 'Найдите товар',
                      leading: const Icon(Icons.search, color: Colors.black45),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                      padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 14)),
                      backgroundColor: const WidgetStatePropertyAll(Color(0xFFEBF0F5)),
                      shadowColor: const WidgetStatePropertyAll(Colors.transparent),
                      controller: _searchController,
                      onTap: () {
                        controller.openView();
                      },
                    );
                  },
                  suggestionsBuilder: (BuildContext _, SearchController controller) {
                    //rebuildSuggestions();


                    if(state is ClientSearchLoaded) {
                      final ClientSearchLoaded innerState = context.read<ClientSearchBloc>().state as ClientSearchLoaded;

                      return List<ListTile>.generate(innerState.itemsForSearch.length, (int index) {
                        final String item = innerState.itemsForSearch[index];
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            setState(() {
                              //context.push(AppRouter.searchPage.routePath, extra: item);
                              controller.closeView('');
                            });
                          },
                        );
                      });
                    } else {
                      return <Widget>[];
                    }
                  }
              ),
            );
          },
        ),
      ),
    );
  }
}
