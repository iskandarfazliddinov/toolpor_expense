import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toolpor_expense/presentation/resources/app_icons.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';
import 'package:toolpor_expense/presentation/screens/cubits/categories_cubit/categories_cubit.dart';
import 'package:toolpor_expense/presentation/screens/cubits/categories_cubit/category.dart';
import 'package:toolpor_expense/presentation/screens/dialog_screen/dialog_screen.dart';
import 'package:toolpor_expense/presentation/widgets/w_categories_color.dart';
import 'package:toolpor_expense/presentation/widgets/w_category_items.dart';
import 'package:toolpor_expense/presentation/widgets/w_detail_items.dart';
import 'package:toolpor_expense/presentation/widgets/w_edit_item.dart';

import '../catigory_data.dart';
import '../resources/app_colors.dart';

class WCategories extends StatelessWidget {
  const WCategories({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(
                color: Colors.white,
                endIndent: 160,
                thickness: 2,
                indent: 160,
              ),
              SizedBox(
                height: 450,
                child: BlocBuilder<CategoriesCubit, CategoriesState>(
                  builder: (context, state) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: categoryData.length,
                      itemBuilder: (context, index) => WCategoryItems(
                        title: categoryData[index].title,
                        icon: categoryData[index].icon,
                        onTab: () {
                          if(index != categoryData.length-1){
                            Navigator.of(context).pop(index);
                          }else{
                            showDialog(
                              context: context,
                              builder: (context) =>
                              const WCategoriesColor(),
                            );
                          }
                        },
                        color: categoryData[index].color,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
