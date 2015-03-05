//
//  SearchFlowLayout.m
//  LifeBlink
//
//  Created by Ahmed AlMoraly on 3/5/15.
//  Copyright (c) 2015 Inovaton. All rights reserved.
//

#import "SearchFlowLayout.h"

@implementation SearchFlowLayout

-  (NSArray *) layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSMutableArray *answer = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    UICollectionView * const cv = self.collectionView;
    CGPoint const contentOffset = cv.contentOffset;
    
    NSMutableIndexSet *missingSections = [NSMutableIndexSet indexSet];
    for (UICollectionViewLayoutAttributes *layoutAttributes in answer) {
        if (layoutAttributes.representedElementCategory == UICollectionElementCategoryCell) {
            [missingSections addIndex:layoutAttributes.indexPath.section];
        }
    }
    for (UICollectionViewLayoutAttributes *layoutAttributes in answer) {
        if ([layoutAttributes.representedElementKind isEqualToString:UICollectionElementKindSectionHeader]) {
            [missingSections removeIndex:layoutAttributes.indexPath.section];
        }
    }
    
    [missingSections enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:idx];
        
        UICollectionViewLayoutAttributes *layoutAttributes = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
        
        [answer addObject:layoutAttributes];
        
    }];
    
    for (UICollectionViewLayoutAttributes *layoutAttributes in answer) {
        
        if ([layoutAttributes.representedElementKind isEqualToString:UICollectionElementKindSectionHeader]) {
            
            NSInteger section = layoutAttributes.indexPath.section;
            NSInteger numberOfItemsInSection = [cv numberOfItemsInSection:section];
            
            NSIndexPath *firstCellIndexPath = [NSIndexPath indexPathForItem:0 inSection:section];
            NSIndexPath *lastCellIndexPath = [NSIndexPath indexPathForItem:MAX(0, (numberOfItemsInSection - 1)) inSection:section];
            
            UICollectionViewLayoutAttributes *firstCellAttrs = [self layoutAttributesForItemAtIndexPath:firstCellIndexPath];
            UICollectionViewLayoutAttributes *lastCellAttrs = [self layoutAttributesForItemAtIndexPath:lastCellIndexPath];
            
            if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
                CGFloat headerHeight = CGRectGetHeight(layoutAttributes.frame);
                CGPoint origin = layoutAttributes.frame.origin;
                origin.y = contentOffset.y + self.collectionView.contentInset.top + self.sectionInset.top;
//                MIN(
//                               MAX(contentOffset.y, (CGRectGetMinY(firstCellAttrs.frame) - headerHeight)),
//                               (CGRectGetMaxY(lastCellAttrs.frame) - headerHeight)
//                               );
//                
                layoutAttributes.zIndex = MAXFLOAT;
                layoutAttributes.frame = (CGRect){
                    .origin = origin,
                    .size = layoutAttributes.frame.size
                };
                
                NSLog(@"header: %@", layoutAttributes);
            } else {
                CGFloat headerWidth = CGRectGetWidth(layoutAttributes.frame);
                CGPoint origin = layoutAttributes.frame.origin;
                origin.x = MIN(
                               MAX(contentOffset.x, (CGRectGetMinX(firstCellAttrs.frame) - headerWidth)),
                               (CGRectGetMaxX(lastCellAttrs.frame) - headerWidth)
                               );
                
                layoutAttributes.zIndex = 1024;
                layoutAttributes.frame = (CGRect){
                    .origin = origin,
                    .size = layoutAttributes.frame.size
                };
            }
        
    }
        else {
            layoutAttributes.zIndex = 1;
        }
    }
    
    return answer;
    
}

- (BOOL) shouldInvalidateLayoutForBoundsChange:(CGRect)newBound {
    
    return YES;
    
}

@end
