import 'package:flutter/material.dart';
import '../../widget/widgets.dart';
import 'course_desc.dart';
import 'course_comment.dart';
import 'course_recom.dart';

//import 'package:graphql/client.dart';
//import '../../entitys/CourseData.dart';
import '../../api/apis.dart';
import 'package:lulab/entitys/CourseData.dart';

/// 课程视频播放页面

class CourseIndexPage extends StatefulWidget {
  CourseIndexPage({Key? key}) : super(key: key);

  @override
  _CourseIndexPageState createState() => _CourseIndexPageState();
}

class _CourseIndexPageState extends State<CourseIndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        toolbarHeight: 0,
        toolbarOpacity: 0,
        backgroundColor: (Colors.black),
      ),
      body: CourseIndex(),
    );
  }
}

class CourseIndex extends StatefulWidget {
  CourseIndex({Key? key}) : super(key: key);

  @override
  _CourseIndexState createState() => _CourseIndexState();
}

class _CourseIndexState extends State<CourseIndex>
    with TickerProviderStateMixin {
  PostsData? _postsData;
  String? tu;
  // 声明tabcontroller和tab标题
  late TabController _tabController;
  List tabs = ["简介", "评价", "推荐"];

  @override
  void initState() {
    super.initState();
    _loadAllData();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  // 读取所有数据
  _loadAllData() async {
    // _postsData =
    //     (await GqlCourseAPI.indexPageInfo(context: context, params: {}))
    //         as Future<PostsData>;
    _postsData = await GqlCourseAPI.indexPageInfo(schema: '', context: context);
    final ty = _postsData!.latestCourse[1];
    tu = ty.videoUrl;
    print("========================================================");
    print(tu);
    print("764836");
    print("================================================================");
    return tu;

    // if (mounted) {
    //   setState(() {});
    // }
  }

  @override
  Widget build(BuildContext context) {
    print("========================================================");
    print(tu);
    print("================================================================");

    return Container(
      child: Column(
        children: [
          VideoView(
            //tu,
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
            cover: 'https://images8.alphacoders.com/498/thumb-1920-498307.jpg',
          ),
          // tab栏
          _buildTabNavigation(),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TabBarView(
                controller: _tabController,
                children: [
                  CourseDescPage(),
                  CourseCommentPage(),
                  CourseRecomPage(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

// tab栏具体实现
  _buildTabNavigation() {
    //使用Material实现阴影效果
    return Material(
      elevation: 5,
      shadowColor: Colors.grey[100],
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20),
        height: 40,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _tabBar(),
          ],
        ),
      ),
    );
  }

  _tabBar() {
    return HiTab(
      tabs.map<Tab>((name) {
        return Tab(
          text: name,
        );
      }).toList(),
      controller: _tabController,
    );
  }
}

// 底部弹起新页面
void bounceBottomSheet(BuildContext context, Widget bouncePage) {
  showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return bouncePage;
      });
}
