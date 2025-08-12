import 'package:flutter/material.dart';


class StatisticsScreen extends StatefulWidget {
  @override
  _ReloadPageState createState() => _ReloadPageState();
}

class _ReloadPageState extends State<StatisticsScreen> {
  String selectedPeriod = 'Monthly';
  
  final List<ChartData> chartData = [
    ChartData('Jan', 7500, 4800),
    ChartData('Feb', 7800, 4600),
    ChartData('Mar', 7200, 4700),
    ChartData('Apr', 7600, 4500),
    ChartData('May', 7400, 4600),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Reload',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Range and Period Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Jan 28 - May 28, 2025',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFF7C3AED),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        selectedPeriod,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 30),
            
            // Chart
            Container(
              height: 200,
              child: CustomPaint(
                painter: BarChartPainter(chartData),
                size: Size.infinite,
              ),
            ),
            
            SizedBox(height: 30),
            
            // Income and Outcome Cards
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    '15000 EG',
                    'Income',
                    Color(0xFF7C3AED),
                    Icons.trending_up,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _buildStatCard(
                    '35000 EG',
                    'Outcome',
                    Color(0xFF9CA3AF),
                    Icons.trending_down,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String amount, String type, Color color, IconData icon) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          SizedBox(height: 12),
          Text(
            amount,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Text(
            type,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  final String month;
  final double income;
  final double outcome;
  
  ChartData(this.month, this.income, this.outcome);
}

class BarChartPainter extends CustomPainter {
  final List<ChartData> data;
  
  BarChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()..color = Color(0xFF7C3AED); // البنفسجي للدخل
    final paint2 = Paint()..color = Color(0xFF374151); // الرمادي الداكن للمصروفات
    
    final barWidth = 20.0;
    final spacing = (size.width - (data.length * barWidth * 2) - (data.length - 1) * 10) / data.length;
    final maxValue = 8000.0;
    
    // Draw Y-axis labels
    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    
    for (int i = 0; i <= 4; i++) {
      final value = i * 2000;
      final y = size.height - 40 - (i * (size.height - 60) / 4);
      
      textPainter.text = TextSpan(
        text: '${value ~/ 1000}k',
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 12,
        ),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(-30, y - textPainter.height / 2));
    }
    
    // Draw bars and month labels
    for (int i = 0; i < data.length; i++) {
      final x = spacing / 2 + i * (spacing + barWidth * 2 + 10);
      
      // Income bar (blue)
      final incomeHeight = (data[i].income / maxValue) * (size.height - 60);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, size.height - 40 - incomeHeight, barWidth, incomeHeight),
          Radius.circular(4),
        ),
        paint1,
      );
      
      // Outcome bar (dark blue)
      final outcomeHeight = (data[i].outcome / maxValue) * (size.height - 60);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x + barWidth + 4, size.height - 40 - outcomeHeight, barWidth, outcomeHeight),
          Radius.circular(4),
        ),
        paint2,
      );
      
      // Month label
      textPainter.text = TextSpan(
        text: data[i].month,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 12,
        ),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(x + barWidth / 2 - textPainter.width / 2, size.height - 20));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

void main() {
  runApp(MaterialApp(
    home: StatisticsScreen(),
    debugShowCheckedModeBanner: false,
  ));
}