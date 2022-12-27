import 'package:blocexample/models/api_res_model.dart';
import 'package:blocexample/widgets/more_info_widget.dart';
import 'package:flutter/material.dart';

class MoreInfo extends StatefulWidget {
  final Results? results;
  const MoreInfo({Key? key, this.results}) : super(key: key);

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("More Info")),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.deepPurple.withOpacity(0.2),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            NetworkImage("${widget.results?.picture?.large}"),
                        fit: BoxFit.fill),
                    shape: BoxShape.circle,
                    color: Colors.white),
              ),
            ),
            MoreInfoItem(
              title: "Full Name",
              details:
                  "${widget.results?.name?.title}.${widget.results?.name?.first} ${widget.results?.name?.last}",
            ),
            MoreInfoItem(
              title: "Age",
              details: "${widget.results?.dob?.age}",
            ),
            MoreInfoItem(
              title: "Email",
              details: "${widget.results?.email}",
            ),
            MoreInfoItem(
              title: "Date Of birth",
              details: ("${widget.results?.dob?.date}"),
            ),
            MoreInfoItem(
              title: "Street",
              details:
                  "${widget.results?.location?.street?.number}, ${widget.results?.location?.street?.name}",
            ),
            MoreInfoItem(
              title: "city",
              details: "${widget.results?.location?.city}",
            ),
            MoreInfoItem(
              title: "State",
              details: "${widget.results?.location?.state}",
            ),
            MoreInfoItem(
              title: "Country",
              details: "${widget.results?.location?.country}",
            ),
            MoreInfoItem(
              title: "phone",
              details: "${widget.results?.phone}",
            ),
          ],
        ),
      ),
    );
  }
}
