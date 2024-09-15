class Doctor {
  final String id; // Unique identifier
  final String name; // Doctor's full name
  final String specialization; // Doctor's specialization (e.g., Cardiologist)
  final String imageUrl; // Profile image URL
  final double rating; // Rating (out of 5)
  final int reviews; // Number of reviews
  final List<String> hospitals; // List of hospitals where the doctor works
  final String contactNumber; // Contact phone number
  final String email; // Email address
  final Map<String, dynamic> availableTimes; // Available times for appointments (e.g., {"Monday": "9AM-5PM"})
  final bool isOnline; // If the doctor is currently available for online consultation
  final String location; // Clinic or hospital location
  final int experienceYears; // Number of years of experience
  final String biography; // Short biography or description about the doctor
  final List<String> certifications; // List of certifications the doctor holds
  final List<String> services; // List of services offered (e.g., "Cardiology Consultation")
  final double consultationFee; // Doctor's consultation fee

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
    required this.hospitals,
    required this.contactNumber,
    required this.email,
    required this.availableTimes,
    required this.isOnline,
    required this.location,
    required this.experienceYears,
    required this.biography,
    required this.certifications,
    required this.services,
    required this.consultationFee,
  });
}
final List<Doctor> doctors = [
  Doctor(
    id: '1',
    name: 'Dr. Sophia Lee',
    specialization: 'Dermatologist',
    imageUrl: 'assets/images/doctor02.png',
    rating: 4.9,
    reviews: 145,
    hospitals: ['SkinCare Clinic', 'City Health Center'],
    contactNumber: '+1234567890',
    email: 'sophia.lee@example.com',
    availableTimes: {
      'Monday': '10AM - 4PM',
      'Tuesday': '10AM - 4PM',
      'Wednesday': '10AM - 4PM',
      'Thursday': '10AM - 4PM',
      'Friday': '10AM - 4PM',
    },
    isOnline: true,
    location: '101 Park Avenue, Cityville',
    experienceYears: 12,
    biography:
        'Dr. Sophia Lee is an experienced dermatologist specializing in skin care treatments, acne management, and cosmetic procedures.',
    certifications: ['American Board of Dermatology', 'Certified Cosmetic Surgeon'],
    services: ['Skin Consultation', 'Acne Treatment', 'Cosmetic Procedures'],
    consultationFee: 100.0,
  ),
  Doctor(
    id: '2',
    name: 'Dr. Michael Jones',
    specialization: 'Orthopedic Surgeon',
    imageUrl: 'assets/images/doctor03.png',
    rating: 4.7,
    reviews: 200,
    hospitals: ['OrthoCare Clinic', 'City Hospital'],
    contactNumber: '+9876543210',
    email: 'michael.jones@example.com',
    availableTimes: {
      'Monday': '9AM - 5PM',
      'Tuesday': '9AM - 5PM',
      'Thursday': '1PM - 6PM',
      'Friday': '9AM - 1PM',
    },
    isOnline: false,
    location: '78 Elm Street, Townsville',
    experienceYears: 15,
    biography:
        'Dr. Michael Jones is a board-certified orthopedic surgeon, providing expert care for joint and bone issues, including knee replacements and fractures.',
    certifications: ['American Board of Orthopedic Surgery'],
    services: ['Knee Replacement', 'Fracture Treatment', 'Joint Pain Consultation'],
    consultationFee: 180.0,
  ),
  Doctor(
    id: '3',
    name: 'Dr. Emily Carter',
    specialization: 'Pediatrician',
    imageUrl: 'assets/images/doctor04.png',
    rating: 4.8,
    reviews: 160,
    hospitals: ['Children’s Health Clinic', 'Community Hospital'],
    contactNumber: '+1230987654',
    email: 'emily.carter@example.com',
    availableTimes: {
      'Monday': '9AM - 4PM',
      'Tuesday': '9AM - 4PM',
      'Wednesday': '9AM - 12PM',
      'Thursday': '2PM - 6PM',
      'Friday': '9AM - 4PM',
    },
    isOnline: true,
    location: '200 Maple Avenue, Suburbia',
    experienceYears: 8,
    biography:
        'Dr. Emily Carter is a compassionate pediatrician with expertise in child health, vaccinations, and preventive care for infants and young children.',
    certifications: ['American Board of Pediatrics'],
    services: ['Child Health Consultation', 'Vaccinations', 'Growth Monitoring'],
    consultationFee: 110.0,
  ),
  Doctor(
    id: '4',
    name: 'Dr. David Zhang',
    specialization: 'Cardiologist',
    imageUrl: 'assets/images/doctor4.png',
    rating: 4.6,
    reviews: 190,
    hospitals: ['HeartCare Center', 'City Hospital'],
    contactNumber: '+2345678901',
    email: 'david.zhang@example.com',
    availableTimes: {
      'Monday': '8AM - 3PM',
      'Wednesday': '12PM - 6PM',
      'Friday': '8AM - 12PM',
    },
    isOnline: false,
    location: '345 Heart St, Cityville',
    experienceYears: 20,
    biography:
        'Dr. David Zhang is a highly experienced cardiologist specializing in the treatment of heart diseases, hypertension, and preventive cardiology.',
    certifications: ['American Board of Internal Medicine - Cardiovascular Disease'],
    services: ['Heart Consultation', 'ECG', 'Hypertension Management'],
    consultationFee: 220.0,
  ),
  Doctor(
    id: '5',
    name: 'Dr. Linda Martinez',
    specialization: 'Gynecologist',
    imageUrl: 'assets/images/doctor5.png',
    rating: 4.8,
    reviews: 135,
    hospitals: ['Women’s Health Clinic', 'General Hospital'],
    contactNumber: '+3456789012',
    email: 'linda.martinez@example.com',
    availableTimes: {
      'Tuesday': '9AM - 5PM',
      'Thursday': '9AM - 5PM',
      'Friday': '9AM - 12PM',
    },
    isOnline: true,
    location: '567 Women’s Avenue, Metropolis',
    experienceYears: 18,
    biography:
        'Dr. Linda Martinez is a caring and experienced gynecologist, providing reproductive health services, pregnancy care, and preventive screenings for women.',
    certifications: ['American Board of Obstetrics and Gynecology'],
    services: ['Pregnancy Care', 'Reproductive Health Consultation', 'Preventive Screenings'],
    consultationFee: 150.0,
  ),
];
