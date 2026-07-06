import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/features/pricing_plans/data/models/plan_comparison_model.dart';

class PlanComparisonTableWidget extends StatelessWidget {
  final PlanComparisonModel comparisonModel;

  const PlanComparisonTableWidget({super.key, required this.comparisonModel});

  @override
  Widget build(BuildContext context) {
    if (comparisonModel.header.plans.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (comparisonModel.sectionTitle.isNotEmpty) ...[
          Text(
            comparisonModel.sectionTitle,
            style: FontStyles.h3.copyWith(
              color: const Color(0xFF121212),
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
        ],
        if (comparisonModel.sectionDescription.isNotEmpty) ...[
          Text(
            comparisonModel.sectionDescription,
            style: FontStyles.bodyMedium.copyWith(
              color: const Color(0xFF7A7A7A),
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 16.h),
        ],
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE9E9E9)),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: DataTable(
              headingRowColor: WidgetStateProperty.all(const Color(0xFFF9F9F9)),
              dataRowMaxHeight: double.infinity,
              dataRowMinHeight: 48.h,
              columns: comparisonModel.header.plans.map((header) {
                return DataColumn(
                  label: Text(
                    header.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      fontFamily: 'Rubik',
                    ),
                  ),
                );
              }).toList(),
              rows: _buildRows(),
            ),
          ),
        ),
      ],
    );
  }

  List<DataRow> _buildRows() {
    List<DataRow> rows = [];
    
    for (var section in comparisonModel.body.sections) {
      // Add section title row
      rows.add(
        DataRow(
          color: WidgetStateProperty.all(const Color(0xFFF1F1F1)),
          cells: [
            DataCell(Text(
              section.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp, color: Colors.black87),
            )),
            // Empty cells for the rest of the columns
            ...List.generate(
              comparisonModel.header.plans.length - 1, 
              (index) => const DataCell(Text('')),
            )
          ],
        )
      );

      // Add feature rows
      for (var row in section.rows) {
        List<DataCell> cells = [
          DataCell(
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text(
                row.feature,
                style: TextStyle(fontSize: 13.sp),
              ),
            ),
          ),
        ];

        // Add value for each plan in the header (excluding the first 'Feature' column usually)
        for (int i = 1; i < comparisonModel.header.plans.length; i++) {
          final planKey = comparisonModel.header.plans[i].key;
          final valueObj = row.values[planKey];
          
          Widget content;
          if (valueObj == null) {
            content = const Text('-');
          } else if (valueObj.type == 'boolean') {
            content = Icon(
              valueObj.value == '1' || valueObj.value?.toLowerCase() == 'true'
                  ? Icons.check_circle 
                  : Icons.cancel,
              color: valueObj.value == '1' || valueObj.value?.toLowerCase() == 'true'
                  ? Colors.green
                  : Colors.grey,
              size: 20.r,
            );
          } else {
            content = Text(
              valueObj.value ?? '-',
              style: TextStyle(fontSize: 13.sp),
              textAlign: TextAlign.center,
            );
          }
          
          cells.add(DataCell(Center(child: content)));
        }
        
        rows.add(DataRow(cells: cells));
      }
    }
    
    return rows;
  }
}
