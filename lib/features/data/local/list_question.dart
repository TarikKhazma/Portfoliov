
class FAQItem {
  String question;
  String answer;
  FAQItem({required this.question, required this.answer});
}

final List<FAQItem> faqs = [
    FAQItem(
      question: 'What services do you offer as a mobile app developer?',
      answer:
          'I offer end-to-end mobile application development using Flutter. This includes, backend integration, state management, API consumption, real-time features, and app deployment. Whether it\'s a simple note app or a complex system like bike rentals or real-time chat, I build apps that are scalable, secure, and user-friendly.',
    ),
    FAQItem(
      question: 'What platforms do your apps support?',
      answer:
          'I primarily develop cross-platform applications using Flutter, which means your app will work seamlessly on both Android and iOS devices.',
    ),
    FAQItem(
      question: 'Do you offer app maintenance after launch?',
      answer:
          'Yes, I provide post-launch support and maintenance to fix bugs, add new features, update libraries, and ensure compatibility with the latest OS versions.',
    ),
    FAQItem(
      question: 'What makes your work unique?',
      answer:
          'I focus on clean architecture (like MVVM or MVC), modern UI/UX, optimal performance, and a responsive user experience. I also stay up to date with the latest in Flutter and mobile development trends to deliver technically sound solutions.',
    ),
    FAQItem(
      question: 'Can you work with existing designs or backend systems?',
      answer:
          'Absolutely! I can work with your existing UI/UX designs or integrate with third-party or custom backend APIs. I also offer consultation to improve existing app architectures.',
    ),
    FAQItem(
      question: 'How can we start working together?',
      answer:
          'Simply contact me via the form on the Contact page or send me an email. We can schedule a discovery call to discuss your idea, goals, and how I can help bring your vision to life.',
    ),
  ];