import 'package:flutter/material.dart';

/// 底部弹起的课程详情

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CourseDetail(),
    );
  }
}

class CourseDetail extends StatefulWidget {
  CourseDetail({Key? key}) : super(key: key);

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('详情'),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.keyboard_arrow_down))
              ],
            ),
            Divider(
              color: Color(0xffe4e4e4),
            ),
            // 详情标题
            buildDetailTitle(),
            // 详情主体
            buildDetailBody(),
            // 课程介绍
            buildCourseDetail()
          ],
        ),
      ),
    );
  }

  Column buildCourseDetail() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                '课程介绍',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: Wrap(
            children: [
              Text('介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍')
            ],
          ),
        )
      ],
    );
  }

  Container buildDetailTitle() {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Text(
            '颠覆式创新:大公司消失的根本原因',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Container buildDetailBody() {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/a.png'),
            ),
            title: Text(
              '陆向谦',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              '实验室创始人',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          // 课程评价
          ListTile(
            leading: Text(
              '课程评价',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            title: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
                Text(
                  '4.0',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          // 播放次数
          ListTile(
            leading: Text(
              '播放次数',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            title: Row(
              children: [
                Text(
                  '989次播放',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          // 上线时间
          ListTile(
            leading: Text(
              '上线时间',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            title: Row(
              children: [
                Text(
                  '2021年7月9日上线',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          // 课程标签
          ListTile(
            leading: Text(
              '课程标签',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            title: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    '颠覆式创新',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    '公司',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
