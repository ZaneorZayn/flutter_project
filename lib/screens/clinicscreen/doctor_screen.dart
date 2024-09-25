import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_project/models/doctor_model.dart';
import 'package:new_project/screens/clinicscreen/widget/slide.dart';
// Make sure to import your doctor data

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDF8FD),
      appBar: AppBar(
        backgroundColor: const Color(0xff2DB1E5),
        shadowColor: Colors.black,
        title: Row(
          children: [
            Text("Doctor", style: Theme.of(context).textTheme.headlineLarge),
          ],
        ),
        actions: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey,
                width: 1.5,
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icon/Heart.svg',
                color: const Color(0xff64748B),
                width: 30,
                height: 30,
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 8),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xffECFAFF),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: const Color(0xff74D1F6),
                        width: 1.5,
                      ),
                    ),
                    child: const TextField(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        hintText: "Find your suitable doctor!",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Text(
                "Specialist",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctors[2];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color(0xffE0F7FA), // Background color for the image
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(26),
                            child: Image.asset(
                              doctor.imageUrl,
                              width: 80,
                              height: 90,
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctor.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff1D3557),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 16),
                                  Text(
                                    ' ${doctor.rating} (${doctor.reviews})',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.lock_clock, size: 16, color: Colors.blue),
                                  Text(
                                    ' ${doctor.experienceYears}+Years',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${doctor.specialization} - ${doctor.hospitals.first}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                color: Color(0xffE8E8E8),
                height: 1,
                thickness: 1, // Adjust the thickness to your preference
               
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Available Doctor",style: Theme.of(context).textTheme.headlineLarge,),
                  TextButton(onPressed: (){}, child: Text("View All",style: Theme.of(context).textTheme.headlineSmall,))
                ],
              ),
            ),
            ImageSlider(),
          ],
        ),
      ),
    );
  }
}
