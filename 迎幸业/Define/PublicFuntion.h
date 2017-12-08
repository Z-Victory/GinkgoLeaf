
//
//  PublicFuntion.h
//  XDSQ
//
//  Created by 刘亚和 on 2017/7/18.
//  Copyright © 2017年 Meciery. All rights reserved.
//

#ifndef PublicFuntion_h
#define PublicFuntion_h


#endif /* PublicFuntion_h */

/**
 屏幕宽度
 
 @param view
 @return CGSize
 */
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

/**
 屏幕高度
 
 @param view
 @return CGSize
 */
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

/**
*	获取视图宽度
*
*	@param 	view 	视图对象
*
*	@return	宽度
*/
#define DEF_WIDTH(view) view.bounds.size.width

/**
 *	获取视图高度
 *
 *	@param 	view 	视图对象
 *
 *	@return	高度
 */
#define DEF_HEIGHT(view) view.bounds.size.height

/**
 *	获取视图右下角纵坐标
 *
 *	@param 	view 	视图对象
 *
 *	@return	右下角纵坐标
 */
#define DEF_BOTTOM(view) (DEF_Y(view) + DEF_HEIGHT(view))

/**
 *	获取视图原点横坐标
 *
 *	@param 	view 	视图对象
 *
 *	@return	原点横坐标
 */
#define DEF_X(view) view.frame.origin.x

/**
 *	获取视图原点纵坐标
 *
 *	@param 	view 	视图对象
 *
 *	@return	原点纵坐标
 */
#define DEF_Y(view) view.frame.origin.y

/**
 *	获取视图右侧坐标
 *
 *	@param 	view 	视图对象
 *
 *	@return	视图右侧坐标
 */
#define DEF_RIGHT(view) (view.frame.origin.x + view.frame.size.width)
