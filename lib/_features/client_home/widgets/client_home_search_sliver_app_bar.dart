import 'package:flutter/material.dart';

import '../../auth/models/auth_user.dart';
import 'client_home_search_text_field.dart';
import 'user_name_animation.dart';

class ClientHomeSearchSliverAppBar extends StatefulWidget {
  const ClientHomeSearchSliverAppBar({super.key, required this.fio, required this.userType});

  final String fio;
  final UserType userType;

  @override
  State<ClientHomeSearchSliverAppBar> createState() => _ClientHomeSearchSliverAppBarState();

}

class _ClientHomeSearchSliverAppBarState extends State<ClientHomeSearchSliverAppBar> {

  bool _isFlexible = false;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 140,
      collapsedHeight: 90,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {

          const double expandedHeight = 140;
          const double collapsedHeight = 90;

          final double progress = normalize(constraints.maxHeight-kToolbarHeight, collapsedHeight, expandedHeight);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              if(constraints.maxHeight-kToolbarHeight < 120 && !_isFlexible) {
                _isFlexible = true;
              }
              if(constraints.maxHeight-kToolbarHeight > 120 && _isFlexible) {
                _isFlexible = false;
              }
            });
          });



          return Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              AnimatedPositioned(
                top: _isFlexible ? kToolbarHeight+8 : 150-((constraints.maxHeight-kToolbarHeight)*(1-progress))*0.5,
                left: 22,
                duration: const Duration(milliseconds: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.fio.split(' ')[0], style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
                    Text(widget.userType.value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                top: _isFlexible ? kToolbarHeight+8 : 150-((constraints.maxHeight-kToolbarHeight)*(1-progress))*0.5,
                right: 22,
                child: SizedBox(
                  height: 52,
                  width: 52,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            height: 8,
                            width: 8,
                            decoration: const BoxDecoration(
                              color: Colors.black12,
                              shape: BoxShape.circle,
                            ),
                          )
                      ),
                      Align(
                        child: SizedBox(
                          height: 44,
                          width: 44,
                          child: IconButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                            ),
                            onPressed: (){
                              //context.push(Routers.newAppointmentSelectDoctorRoute.path);
                            },
                            icon: const Icon(Icons.notifications, color: Colors.black26,),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ),
              AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  top: 12,
                  left: 22,
                  right: _isFlexible ? 86 : 22,
                  child: SizedBox(
                      width: constraints.maxWidth-(70*(1-progress)),
                      child: const ClientHomeSearchTextField()
                  )
              ),
            ],
          );
        },
      ),
    );
  }
}

double normalize(double value, double min, double max) {
  return ((value - min) / (max - min)).clamp(0.0, 1.0);
}
